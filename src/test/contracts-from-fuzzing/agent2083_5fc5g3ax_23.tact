struct MultiSerializer {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: Int;
    e: String;
}

contract MixedSerialization {
    s: MultiSerializer;

    init() {
        self.s = MultiSerializer{
            a: 5,
            b: 10,
            c: false,
            d: 15,
            e: "text",
        };
    }
}
