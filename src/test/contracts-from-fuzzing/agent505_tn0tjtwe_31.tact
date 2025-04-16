contract OptionalSerialize {
    a: Int? as uint32;
    b: Bool?;

    init() {
        self.a = null;
        self.b = null;
    }
}
