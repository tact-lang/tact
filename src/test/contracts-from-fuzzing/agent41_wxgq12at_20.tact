contract OptionalTiny {
    a: Int? as uint8;
    b: Int? as int4;

    init() {
        self.a = null;
        self.b = null;
    }
}
