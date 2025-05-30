contract OptionalDefaultSerialization {
    a: Int? as int32;
    b: Bool?;
    s: String?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
    }
}