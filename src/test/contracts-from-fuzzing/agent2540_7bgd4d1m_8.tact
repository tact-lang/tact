struct SerializeVariants {
    n_default: Int;
    n_uint8: Int as uint8;
    n_int64: Int as int64;
    n_uint256: Int as uint256;
}

contract SerializeTest {
    data: SerializeVariants;

    init() {
        self.data = SerializeVariants{
            n_default: 123,
            n_uint8: 12,
            n_int64: -1111,
            n_uint256: 9999999999
        };
    }
}