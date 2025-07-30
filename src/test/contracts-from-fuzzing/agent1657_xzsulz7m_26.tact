contract SerializeOptional {
    a: Int? as uint32;
    b: Int? as int64;
    init() {
        self.a = null;
        self.b = 12345678;
    }
}