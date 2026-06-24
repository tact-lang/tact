struct StringVariants {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract MixStrings {
    s: StringVariants;
    init() {
        self.s = StringVariants{
            a:"A",
            b:null,
            c:"C",
            d:"D",
        };
    }
}