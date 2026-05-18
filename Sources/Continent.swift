/// A continents of the world.
/// - Important: Antarctica is excluded because it has no sovereign countries.
public enum Continent: String, CaseIterable, Codable, Sendable {
    case Asia
    case Africa
    case Europe
    case NorthAmerica
    case SouthAmerica
    case Australia
    // Antarctica has no countries
}



// MARK: - Behavior Extensions

extension Continent {
    
    /// All countries located on this continent.
    public var countries: [Country] {
        return switch self {
        case .Asia: Country.allAsian
        case .Africa: Country.allAfrican
        case .Europe: Country.allEuropean
        case .NorthAmerica: Country.allNorthAmerican
        case .SouthAmerica: Country.allSouthAmerican
        case .Australia: Country.allAustralian
        }
    }
    
}
