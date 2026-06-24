contract IntWithSerialization {
    a: Int as uint8;
    b: Int as int16;

    init() {
        self.a = 123;
        self.b = -12345;
    }
}