struct SerialMixed {
    a: Int as int64;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
}

contract MixedSerialization {
    nested: SerialMixed;

    init() {
        self.nested = SerialMixed{
            a: -1000,
            b: true,
            c: "foo",
            d: null,
            e: false,
            f: "bar"
        };
    }
}