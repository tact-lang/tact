contract OptionalSerializeContract {
    a: Int? as uint64;
    b: Int? as int128;

    init() {
        self.a = 123456789;
        self.b = -123456789012345;
    }
}
