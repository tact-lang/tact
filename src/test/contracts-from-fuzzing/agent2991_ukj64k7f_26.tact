contract Test {
    maxIntSigned: Int as int256;

    init() {
        self.maxIntSigned = 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
}