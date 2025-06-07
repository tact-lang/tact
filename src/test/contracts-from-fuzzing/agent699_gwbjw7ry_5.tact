struct MixedSerialized {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializeContract {
    val: MixedSerialized;

    init() {
        self.val = MixedSerialized{
            a: 7,
            b: -5,
            c: 65535,
            d: -123456789,
        };
    }
}