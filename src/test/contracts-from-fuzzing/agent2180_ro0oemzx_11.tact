struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedOptional {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 5,
            b: false,
            c: "abc",
            d: null,
            e: true,
            f: null
        };
    }
}