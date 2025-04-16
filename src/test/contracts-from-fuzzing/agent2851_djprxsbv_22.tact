contract OptionalSerializations {
    a: Int? as uint4;
    b: Int? as int64;

    init() {
        self.a = null;
        self.b = null;
    }
}
