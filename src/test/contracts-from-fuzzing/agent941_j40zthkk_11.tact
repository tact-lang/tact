contract MaxBitsIntSerialization {
    wide: Int as int257 = 0;
    signed64: Int as int64 = 0;
    unsigned64: Int as uint64 = 0;
    smallUint: Int as uint4 = 0;

    receive() {
        self.wide = -1;
        self.signed64 = 1;
        self.unsigned64 = 2;
        self.smallUint = 3;
    }
}