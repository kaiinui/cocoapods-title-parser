cocoapods-title-parser
======================

CocoaPods title parse scripts to implement autocomplete.

Usage
======================

`ruby scrape.rb` to scrape cocoapods names from COCOAPODS SEARCH (http://cocoapods.wantedly.com/)
Default wait between request is 5 seconds.
Please note pagination count is now put in code (see scrape.rb's `530`)

`ruby parse.rb 5` to parse cocoapods names to words (like `"TYPFontAwesome"` => `["font", "awesome"]`)
Then take words that appears more than 5 times.
Change 5 to any number to obtain desired result.

`titles.json` provides scraped cocoapods names (scraped on 20 Jan 2014)

`nouns.json` provides parsed one.
