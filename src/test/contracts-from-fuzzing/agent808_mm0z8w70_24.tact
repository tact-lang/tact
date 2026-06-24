contract IntSerializationTest {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int32;

    init() {
        self.a = 5;
        self.b = 10;
        self.c = -42;
    }
}