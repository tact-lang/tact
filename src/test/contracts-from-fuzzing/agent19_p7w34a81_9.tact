struct IntVariants {
    signed64: Int as int64;
    signed128: Int as int128;
    unsigned32: Int as uint32;
    unsigned256: Int as uint256;
}

contract IntSerializationContract {
    ints: IntVariants;

    init() {
        self.ints = IntVariants{
            signed64: -64,
            signed128: -128,
            unsigned32: 32,
            unsigned256: 256,
        };
    }
}