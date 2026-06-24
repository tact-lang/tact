struct StringStruct {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract ManyStrings {
    f: StringStruct;
    init() {
        self.f = StringStruct{
            a: "aa",
            b: "bb",
            c: "cc",
            d: "dd"
        };
    }
}