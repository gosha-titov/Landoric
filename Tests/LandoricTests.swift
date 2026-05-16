import Foundation
import Testing
@testable import Landoric

@Test func creation() async throws {
    #expect(Country(isoCode: "RU") == .Russia)
    #expect(Country(isoCode: "cn") == .China)
    #expect(Country(isoCode: "US") == .UnitedStates)
    #expect(Country(isoCode: "br") == .Brazil)
    #expect(Country(isoCode: "Eg") == .Egypt)
    #expect(Country(isoCode: "AU") == .Australia)
}

@Test func presence() async throws {
    let sourceCodes = isoCountryCodes.sorted()
    let addedCodes = Country.all.map(\.isoCode).sorted()
    for (addedCode, sourceCode) in zip(addedCodes, sourceCodes) {
        #expect(addedCode == sourceCode)
    }
}

@Test func count() async throws {
    let sourceCodes = isoCountryCodes
    let addedCodes = Country.all.map(\.isoCode)
    #expect(addedCodes.count == sourceCodes.count)
}

@Test func codable() async throws {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let country1: Country = .Russia
    let country2: Country = .China
    let country3: Country = .UnitedStates
    let country4: Country = .Brazil
    let country5: Country = .Egypt
    let country6: Country = .Australia
    
    func encodeDecode(_ country: Country) throws -> Country {
        let encoded = try encoder.encode(country)
        return try decoder.decode(Country.self, from: encoded)
    }
    
    #expect(try encodeDecode(country1) == country1)
    #expect(try encodeDecode(country2) == country2)
    #expect(try encodeDecode(country3) == country3)
    #expect(try encodeDecode(country4) == country4)
    #expect(try encodeDecode(country5) == country5)
    #expect(try encodeDecode(country6) == country6)
}

@Test func unique() async throws {
    let array = Country.all
    let set = Set(array)
    #expect(array.count == set.count)
}



// MARK: - Helpers

private var isoCountryCodes: [String] {
    return NSLocale.isoCountryCodes.filter { $0 != "AQ" && $0 != "CQ" } // Without "Antarctica" and "the island of Sark"
}
