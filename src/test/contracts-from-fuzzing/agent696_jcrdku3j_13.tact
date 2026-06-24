struct MixedSerialization {
    a: Int as int16;
    b: Int;
    c: Int as uint64;
    d: Bool;
    e: String;
}

contract TestContract {
    s: MixedSerialization;

    init() {
        self.s = MixedSerialization{
            a: -100,
            b: 200000,
            c: 123456789,
            d: true,
            e: "X"
        };
    }
}