extension Country {
    
    /// Returns all countries located on the South America continent sorted by name.
    public static let allSouthAmerican = [
        Argentina, Aruba,
        Bolivia, Brazil, BouvetIsland,
        CaribbeanNetherlands, Chile, Colombia, Curacao,
        Ecuador,
        FalklandIslands, FrenchGuiana,
        Guyana,
        Paraguay, Peru,
        SouthGeorgiaAndSouthSandwichIslands, Suriname,
        Uruguay,
        Venezuela
    ]
    
    
    public static var Argentina: Country {
        return Country(systemName: "Argentina", isoCode: "AR", population: 45_985_000, area: 2_780_400)
    }
    
    public static var Aruba: Country {
        return Country(systemName: "Aruba", isoCode: "AW", population: 108_000, area: 179)
    }
    
    public static var Bolivia: Country {
        return Country(systemName: "Bolivia", isoCode: "BO", population: 12_749_000, area: 1_098_581)
    }
    
    public static var Brazil: Country {
        return Country(systemName: "Brazil", isoCode: "BR", population: 213_562_000, area: 8_515_767)
    }
    
    public static var BouvetIsland: Country {
        return Country(systemName: "BouvetIsland", isoCode: "BV", population: 0, area: 49)
    }
    
    public static var CaribbeanNetherlands: Country {
        return Country(systemName: "CaribbeanNetherlands", isoCode: "BQ", population: 32_000, area: 328)
    }
    
    public static var Chile: Country {
        return Country(systemName: "Chile", isoCode: "CL", population: 19_942_000, area: 756_102)
    }
    
    public static var Colombia: Country {
        return Country(systemName: "Colombia", isoCode: "CO", population: 53_885_000, area: 1_141_748)
    }
    
    public static var Curacao: Country {
        return Country(systemName: "Curacao", isoCode: "CW", population: 185_000, area: 444)
    }
    
    public static var Ecuador: Country {
        return Country(systemName: "Ecuador", isoCode: "EC", population: 18_444_000, area: 283_561)
    }
    
    public static var FalklandIslands: Country {
        return Country(systemName: "FalklandIslands", isoCode: "FK", population: 3_000, area: 12_173)
    }
    
    public static var FrenchGuiana: Country {
        return Country(systemName: "FrenchGuiana", isoCode: "GF", population: 318_000, area: 84_000)
    }
    
    public static var Guyana: Country {
        return Country(systemName: "Guyana", isoCode: "GY", population: 840_000, area: 214_969)
    }
    
    public static var Paraguay: Country {
        return Country(systemName: "Paraguay", isoCode: "PY", population: 7_084_000, area: 406_752)
    }
    
    public static var Peru: Country {
        return Country(systemName: "Peru", isoCode: "PE", population: 34_922_000, area: 1_285_216)
    }
    
    public static var SouthGeorgiaAndSouthSandwichIslands: Country {
        return Country(systemName: "SouthGeorgiaAndSouthSandwichIslands", isoCode: "GS", population: 30, area: 3_903)
    }
    
    public static var Suriname: Country {
        return Country(systemName: "Suriname", isoCode: "SR", population: 645_000, area: 163_820)
    }
    
    public static var Uruguay: Country {
        return Country(systemName: "Uruguay", isoCode: "UY", population: 3_382_000, area: 176_215)
    }
    
    public static var Venezuela: Country {
        return Country(systemName: "Venezuela", isoCode: "VE", population: 28_613_000, area: 916_445)
    }
    
}



// MARK: - Helpers

private extension Country {
    
    init(systemName: String, isoCode: String, population: Int, area: Int) {
        self.init(systemName: systemName, isoCode: isoCode, continent: .SouthAmerica, population: population, area: area)
    }
    
}

