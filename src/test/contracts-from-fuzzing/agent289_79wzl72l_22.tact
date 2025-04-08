struct MixSerialization {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int128;
    e: Int as uint256;
    f: Int;
}

contract SerializeMixTest {
    rec: MixSerialization;

    init() {
        self.rec = MixSerialization{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5,
            f: -6
        };
    }
}