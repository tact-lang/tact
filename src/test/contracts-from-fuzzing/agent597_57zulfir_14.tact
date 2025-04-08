struct S {
    a: Int?;
    b: Int;
    c: String?;
    d: Bool?;
    e: String;
}

contract MixedDefaults {
    rec: S;
    init() {
        self.rec = S{
            a: null,
            b: 37,
            c: null,
            d: true,
            e: "abc"
        };
    }
}