contract EdgeIntSerialization {
    small_int: Int as int8;
    large_uint: Int as uint256;

    init() {
        self.small_int = -128;
        self.large_uint = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
}