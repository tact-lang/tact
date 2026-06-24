struct MixedPacked {
    a: Int as uint8;
    b: Int;
    c: Int as int64;
    d: Int;
    e: Int as uint32;
}

contract MixedSerialization {
    mixed: MixedPacked;

    init() {
        self.mixed = MixedPacked{
            a:1, b:2, c:3, d:4, e:5
        };
    }
}