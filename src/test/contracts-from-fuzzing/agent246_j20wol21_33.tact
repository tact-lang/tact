contract OptionalWithSerialize {
    a: Int? as uint8;
    b: Int? as int64 = null;

    init() {
        self.a = null;
        self.b = -999;
    }
}