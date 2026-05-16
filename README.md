# Countries

A lightweight Swift library providing country metadata — ISO codes, population, area, continent, localized names, and flag emojis.


## Features

- **250+ countries** with population and area data
- **Type-safe continents** via the `Continent` enum
- **Localized names** using `NSLocale`
- **Flag emojis** generated from ISO codes


## Usage

### Access a country

```swift
let country = Country.Turkey
country.systemName     // "Turkey"
country.localizedName  // "Türkiye"
country.flagEmoji      // "🇹🇷"
country.continent      // .Asia
country.population     // 87_926_000
country.area           // 783_562
```


### Create by ISO code

```swift
if let country = Country(isoCode: "FR") {
    print(country.systemName) // "France"
}
```

### List all countries

```swift
let all = Country.all
// Ordered by continent: Europe → Asia → North America → South America → Africa → Australia
```

### Browse by continent

```swift
let european = Continent.Europe.countries
let asian = Continent.Asia.countries
```

## API Overview

### `Country`

| Property | Type | Description |
|----------|------|-------------|
| `isoCode` | `String` | Two-letter ISO 3166-1 alpha-2 code |
| `population` | `Int` | Approximate population |
| `area` | `Int` | Approximate area in km² |
| `continent` | `Continent` | Continent where the country is located |
| `systemName` | `String` | Internal debug name |
| `localizedName` | `String?` | Name in the current locale |
| `flagEmoji` | `Character` | Country flag emoji |

### `Continent`

```swift
public enum Continent: String, CaseIterable, Sendable {
    case Asia
    case Africa
    case Europe
    case NorthAmerica
    case SouthAmerica
    case Australia
}
```

| Property | Description |
|----------|-------------|
| `countries` | All countries on this continent |

## Data Notes

- Population and area figures are approximate and sourced from public datasets.
- Antarctica is excluded because it has no sovereign countries.
- Country names are localized via `NSLocale`; availability depends on the system's locale data.


## Installation

Add `Landoric` via Swift Package Manager:

```
https://github.com/gosha-titov/Landoric.git
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/gosha-titov/Landoric.git",
        .upToNextMinor(from: "1.0.0")
    )
]
```
