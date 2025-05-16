contract SerializationOptionsTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint3;
    d: Int as int5;

    init() {
        self.a = 12;
        self.b = 200;
        self.c = 7;
        self.d = -3;
    }
}