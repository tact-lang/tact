contract OptionalSerialize {
    a: Int? as uint32;
    b: Int? as int32;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}