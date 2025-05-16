contract OptionalAfterSerialization {
    a: Int as uint32;
    b: Int?;

    init() {
        self.a = 42;
        self.b = null;
    }
}