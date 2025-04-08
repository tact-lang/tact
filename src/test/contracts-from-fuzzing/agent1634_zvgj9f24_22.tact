contract SignedAndUnsigned {
    intSigned: Int as int64;
    intUnsigned: Int as uint64;

    init() {
        self.intSigned = -42;
        self.intUnsigned = 42;
    }
}