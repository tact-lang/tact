struct HasBigInt {
    a: Int = 0;
    b: Int as uint256 = 0;
    c: Int as int257 = 0;
}

contract BigIntsPersistent {
    data: HasBigInt;
    init() {
        self.data = HasBigInt{};
    }
}