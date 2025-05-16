contract IntSerializationDefault {
    a: Int as uint8 = 5;
    b: Int as int8 = -7;

    init() {
        self.a = 10;
        self.b = -4;
    }
}