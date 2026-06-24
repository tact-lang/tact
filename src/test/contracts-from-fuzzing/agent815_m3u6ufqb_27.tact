contract SerialOptional {
    a: Int? as int64;
    b: Int? as uint64;

    init() {
        self.a = null;
        self.b = null;
    }
}