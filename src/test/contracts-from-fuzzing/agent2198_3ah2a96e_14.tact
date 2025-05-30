contract SerializeSignedUnsigned {
    sn: Int as int64;
    un: Int as uint64;

    init() {
        self.sn = -42;
        self.un = 42;
    }
}