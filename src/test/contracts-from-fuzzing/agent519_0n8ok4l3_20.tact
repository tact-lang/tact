contract IntSerializationTest {
    a: Int as uint32;
    b: Int as int64;
    c: Int;

    init() {
        self.a = 123456;
        self.b = -1234567890;
        self.c = 789;
    }
}