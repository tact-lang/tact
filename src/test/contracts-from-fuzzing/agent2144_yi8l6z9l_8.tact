struct Mixed {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFields {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: "hello",
            c: true,
            d: null,
            e: false,
            f: null
        };
    }
}
