contract IntSerializationTest {
    a: Int as uint4;
    b: Int as int4;

    init() {
        self.a = 10;
        self.b = -7;
    }
}