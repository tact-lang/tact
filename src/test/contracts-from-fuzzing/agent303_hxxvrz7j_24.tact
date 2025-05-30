struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyTypesInStruct {
    s: BigNested;

    init() {
        self.s = BigNested{
            a: 1,
            b: false,
            c: "word",
            d: null,
            e: null,
            f: null,
        };
    }
}