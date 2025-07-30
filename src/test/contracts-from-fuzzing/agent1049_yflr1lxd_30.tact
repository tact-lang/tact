struct Mix {
    a: Int as uint16;
    b: Bool;
    c: String;
    d: String?;
    e: Int? as uint32;
}

contract MixSerialize {
    f: Mix;

    init() {
        self.f = Mix{
            a: 12,
            b: true,
            c: "abc",
            d: null,
            e: null
        };
    }
}