struct Mixed {
    a: Int as uint8 = 0;
    b: Int? as int16;
    c: Bool = true;
    d: String;
    e: Bool?;
}

contract MixedPersist {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 12,
            b: -5,
            c: false,
            d: "hi",
            e: null,
        };
    }
}