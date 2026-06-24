contract OptionalSerialization {
    a: Int? as uint64;
    b: Int?;

    init() {
        self.a = null;
        self.b = null;
    }
}