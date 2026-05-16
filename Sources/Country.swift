import Foundation

/// A country with general information such as population, area, and continent.
///
/// Create a country by its ISO code or use predefined constants:
/// ```
/// let country = Country(isoCode: "TR")!
/// country.systemName     // "Turkey"
/// country.localizedName  // "Türkiye"
/// country.flagEmoji      // "🇹🇷"
/// country.continent      // .Asia
/// country.population     // 87_926_000
/// country.area           // 783_562
/// ```
/// Or access a country directly:
/// ```
/// let country = Country.Turkey
/// country.isoCode // "TR"
/// ```
public struct Country: Sendable {
    
    /// The two-letter ISO country code.
    /// ## Example
    /// ```
    /// Country.Russia.isoCode        // "RU"
    /// Country.China.isoCode         // "CN"
    /// Country.UnitedStates.isoCode  // "US"
    /// ```
    public let isoCode: String
    
    /// The approximate population of the country.
    /// ## Example
    /// ```
    /// Country.China.population   // 1_412_914_000
    /// Country.Russia.population  // 146_119_000
    /// Country.Turkey.population  // 87_926_000
    /// ```
    public let population: Int
    
    /// The approximate area (in square kilometers) of the country.
    /// ## Example
    /// ```
    /// Country.Russia.area  // 17_098_246
    /// Country.France.area  // 551_695
    /// Country.Monaco.area  // 2
    /// ```
    public let area: Int
    
    /// The continent where the country is located.
    /// ## Example
    /// ```
    /// Country.Russia.continent        // .Europe
    /// Country.China.continent         // .Asia
    /// Country.UnitedStates.continent  // .NorthAmerica
    /// ```
    public let continent: Continent
    
    /// The internal name used for debugging.
    /// ## Example
    /// ```
    /// Country.Turkey.systemName      // "Turkey"
    /// Country.Myanmar.systemName     // "Myanmar"
    /// Country.TimorLeste.systemName  // "TimorLeste"
    /// ```
    public let systemName: String
    
    
    // MARK: Init
    
    /// Creates a country with the specified metadata.
    internal init(systemName: String, isoCode: String, continent: Continent, population: Int, area: Int) {
        self.systemName = systemName
        self.isoCode = isoCode
        self.continent = continent
        self.population = population
        self.area = area
    }
    
}



// MARK: - Behavior Extensions

extension Country {
    
    /// All available countries grouped by continent.
    public static var all: [Country] {
        return allEuropean +
               allAsian +
               allNorthAmerican +
               allSouthAmerican +
               allAfrican +
               allAustralian
    }
    
    
    /// The localized name for the current locale, if available.
    /// ## Example
    /// ```
    /// Country.Turkey.localizedName      // "Türkiye"
    /// Country.Myanmar.localizedName     // "Myanmar [Burma]"
    /// Country.TimorLeste.localizedName  // "Timor-Leste"
    /// ```
    public var localizedName: String? {
        let languageCode = NSLocale.current.languageCode ?? ""
        return localizedName(forRegion: languageCode)
    }
    
    /// The country's flag emoji.
    /// ## Example
    /// ```
    /// Country.Russia.flagEmoji        // "🇷🇺"
    /// Country.China.flagEmoji         // "🇨🇳"
    /// Country.UnitedStates.flagEmoji  // "🇺🇸"
    /// ```
    public var flagEmoji: Character {
        return .flagEmoji(forRegion: isoCode) ?? Character("🏴")
    }
    
    
    /// Returns the localized name for a specific language code.
    /// ## Example
    /// ```
    /// let country = Country.Russia
    /// country.localizedName(forRegion: "en")  // "Russia"
    /// country.localizedName(forRegion: "ru")  // "Россия"
    /// country.localizedName(forRegion: "fr")  // "Russie"
    /// ```
    public func localizedName(forRegion languageCode: String) -> String? {
        let locale = NSLocale(localeIdentifier: languageCode)
        let countryCode = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        if let countryName = locale.displayName(forKey: NSLocale.Key.identifier, value: countryCode) {
            return countryName
        }
        return nil
    }
    
    
    /// Creates a country with the given ISO code.
    /// ## Example
    /// ```
    /// let country = Country(isoCode: "TR")!
    /// country.systemName     // "Turkey"
    /// country.localizedName  // "Türkiye"
    /// country.flagEmoji      // "🇹🇷"
    /// country.continent      // .Asia
    /// country.population     // 87_926_000
    /// country.area           // 783_562
    /// ```
    public init?(isoCode: String) {
        let isoCode = isoCode.uppercased()
        guard NSLocale.isoCountryCodes.contains(isoCode) else { return nil }
        if let country = Country.allEuropean.first(by: isoCode) {
            self = country
        } else if let country = Country.allAsian.first(by: isoCode) {
            self = country
        } else if let country = Country.allNorthAmerican.first(by: isoCode) {
            self = country
        } else if let country = Country.allSouthAmerican.first(by: isoCode) {
            self = country
        } else if let country = Country.allAfrican.first(by: isoCode) {
            self = country
        } else if let country = Country.allAustralian.first(by: isoCode) {
            self = country
        } else {
            return nil
        }
    }
    
}


extension Country: Codable {
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(isoCode)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let isoCode = try container.decode(String.self)
        guard let country = Country(isoCode: isoCode) else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: decoder.codingPath,
                debugDescription: "Invalid ISO-code"
            ))
        }
        self = country
    }
    
}


extension Country: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(isoCode)
    }
    
}


extension Country: Equatable {
    
    public static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.isoCode == rhs.isoCode
    }
    
}



// MARK: - Helpers

private extension Character {
    
    /// Returns the flag emoji for a specific ISO country code.
    @inline(__always)
    static func flagEmoji(forRegion countryCode: String) -> Character? {
        guard NSLocale.isoCountryCodes.contains(countryCode) else { return nil }
        let countryCode = countryCode.uppercased()
        let offset = UInt32(127397)
        var flagString = String()
        for scalar in countryCode.unicodeScalars {
            if let scalar = UnicodeScalar(scalar.value + offset) {
                flagString.unicodeScalars.append(scalar)
            }
        }
        return flagString.first
    }
    
}


private extension Array where Element == Country {
    
    /// Returns the first country with the given ISO country code.
    @inline(__always)
    func first(by isoCode: String) -> Element? {
        return first { $0.isoCode  == isoCode }
    }
    
}
