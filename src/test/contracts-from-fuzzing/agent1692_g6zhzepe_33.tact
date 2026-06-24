contract OptionalSerialize {
    a: Int? as uint32;
    b: Int? as int64;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}