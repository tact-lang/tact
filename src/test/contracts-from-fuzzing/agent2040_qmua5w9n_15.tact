struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed {
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: null,
            f: null
        };
    }
}
