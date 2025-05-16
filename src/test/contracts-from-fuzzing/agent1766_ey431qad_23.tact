contract PrimitiveWithSerializationDefaults {
    a: Int as uint8 = 7;
    b: Int as int32 = -100;
    c: Int = 1000000;

    init() {
        self.a = 8;
        self.b = -50;
        self.c = 42;
    }
}
