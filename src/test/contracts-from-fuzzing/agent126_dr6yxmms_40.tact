contract NegativeSerialization {
    a: Int as uint8;
    b: Int as int8;

    init() {
        self.a = -1;
        self.b = -128;
    }
}