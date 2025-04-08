struct MixedSerialize {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
    d: Bool;
    e: String;
}

contract MixedSerializeTest {
    m: MixedSerialize;

    init() {
        self.m = MixedSerialize{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "mix"
        };
    }
}