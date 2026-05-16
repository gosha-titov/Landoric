extension Country {
    
    /// Returns all countries located on the Australia continent sorted by name.
    public static let allAustralian = [
        Australia, AmericanSamoa,
        ClippertonIsland, CookIslands,
        Fiji, FrenchPolynesia,
        Guam,
        HeardAndMcDonaldIslands,
        Kiribati,
        MarshallIslands, Micronesia,
        Nauru, NewCaledonia, NewZealand, Niue, NorfolkIsland, NorthernMarianaIslands,
        OutlyingIslands,
        Palau, PapuaNewGuinea, PitcairnIslands,
        Samoa, SolomonIslands,
        Tokelau, Tonga, Tuvalu,
        Vanuatu,
        WallisAndFutuna
    ]
    
    
    public static var Australia: Country {
        return Country(systemName: "Australia", isoCode: "AU", population: 27_198_000, area: 7_692_024)
    }
    
    public static var AmericanSamoa: Country {
        return Country(systemName: "AmericanSamoa", isoCode: "AS", population: 45_000, area: 199)
    }
    
    public static var ClippertonIsland: Country {
        return Country(systemName: "ClippertonIsland", isoCode: "CP", population: 0, area: 9)
    }
    
    public static var CookIslands: Country {
        return Country(systemName: "CookIslands", isoCode: "CK", population: 13_000, area: 236)
    }
    
    public static var Fiji: Country {
        return Country(systemName: "Fiji", isoCode: "FJ", population: 937_000, area: 18_274)
    }
    
    public static var FrenchPolynesia: Country {
        return Country(systemName: "FrenchPolynesia", isoCode: "PF", population: 283_000, area: 4_167)
    }
    
    public static var Guam: Country {
        return Country(systemName: "Guam", isoCode: "GU", population: 170_000, area: 549)
    }
    
    public static var HeardAndMcDonaldIslands: Country {
        return Country(systemName: "HeardAndMcDonaldIslands", isoCode: "HM", population: 0, area: 368)
    }
    
    public static var Kiribati: Country {
        return Country(systemName: "Kiribati", isoCode: "KI", population: 138_000, area: 811)
    }
    
    public static var MarshallIslands: Country {
        return Country(systemName: "MarshallIslands", isoCode: "MH", population: 35_000, area: 181)
    }
    
    public static var Micronesia: Country {
        return Country(systemName: "Micronesia", isoCode: "FM", population: 114_000, area: 702)
    }
    
    public static var Nauru: Country {
        return Country(systemName: "Nauru", isoCode: "NR", population: 12_000, area: 21)
    }
    
    public static var NewCaledonia: Country {
        return Country(systemName: "NewCaledonia", isoCode: "NC", population: 297_000, area: 18_576)
    }
    
    public static var NewZealand: Country {
        return Country(systemName: "NewZealand", isoCode: "NZ", population: 5_284_000, area: 270_467)
    }
    
    public static var Niue: Country {
        return Country(systemName: "Niue", isoCode: "NU", population: 2_000, area: 262)
    }
    
    public static var NorfolkIsland: Country {
        return Country(systemName: "NorfolkIsland", isoCode: "NF", population: 2_000, area: 35)
    }
    
    public static var NorthernMarianaIslands: Country {
        return Country(systemName: "NorthernMarianaIslands", isoCode: "MP", population: 43_000, area: 464)
    }
    
    public static var OutlyingIslands: Country {
        return Country(systemName: "OutlyingIslands", isoCode: "UM", population: 300, area: 50)
    }
    
    public static var Palau: Country {
        return Country(systemName: "Palau", isoCode: "PW", population: 17_000, area: 459)
    }
    
    public static var PapuaNewGuinea: Country {
        return Country(systemName: "PapuaNewGuinea", isoCode: "PG", population: 10_920_000, area: 462_840)
    }
    
    public static var PitcairnIslands: Country {
        return Country(systemName: "PitcairnIslands", isoCode: "PN", population: 35, area: 49)
    }
    
    public static var Samoa: Country {
        return Country(systemName: "Samoa", isoCode: "WS", population: 220_000, area: 2_831)
    }
    
    public static var SolomonIslands: Country {
        return Country(systemName: "SolomonIslands", isoCode: "SB", population: 858_000, area: 28_896)
    }
    
    public static var Tokelau: Country {
        return Country(systemName: "Tokelau", isoCode: "TK", population: 3_000, area: 11)
    }
    
    public static var Tonga: Country {
        return Country(systemName: "Tonga", isoCode: "TO", population: 103_000, area: 747)
    }
    
    public static var Tuvalu: Country {
        return Country(systemName: "Tuvalu", isoCode: "TV", population: 10_000, area: 26)
    }
    
    public static var Vanuatu: Country {
        return Country(systemName: "Vanuatu", isoCode: "VU", population: 342_000, area: 12_189)
    }
    
    public static var WallisAndFutuna: Country {
        return Country(systemName: "WallisAndFutuna", isoCode: "WF", population: 11_000, area: 274)
    }
    
}



// MARK: - Helpers

private extension Country {
    
    init(systemName: String, isoCode: String, population: Int, area: Int) {
        self.init(systemName: systemName, isoCode: isoCode, continent: .Australia, population: population, area: area)
    }
    
}
