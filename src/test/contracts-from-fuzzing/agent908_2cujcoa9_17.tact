struct MixedSerialized {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int; // default is int257
    e: Int as uint4;
}

contract SerializedMix {
    m: MixedSerialized;

    init() {
        self.m = MixedSerialized{
            a: 5, b: 10, c: -1, d: 0, e: 3
        };
    }
}