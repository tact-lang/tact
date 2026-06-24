contract IntWithSerialization {
    a: Int as int64;
    b: Int as uint64;
    init() {
        self.a = 123;
        self.b = 456;
    }
}