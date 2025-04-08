struct Mixed {
    a: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedFields {
    f: Mixed;
    init() {
        self.f = Mixed{
            a: 1,
            b: true,
            s: "hi",
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}
