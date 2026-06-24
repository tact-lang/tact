struct BigString {
    s01: String; s02: String; s03: String; s04: String; s05: String;
    s06: String; s07: String; s08: String; s09: String; s10: String;
}

contract ManyStrings {
    txts: BigString;
    init() {
        self.txts = BigString{
            s01:"a",s02:"b",s03:"c",s04:"d",s05:"e",
            s06:"f",s07:"g",s08:"h",s09:"i",s10:"j",
        };
    }
}