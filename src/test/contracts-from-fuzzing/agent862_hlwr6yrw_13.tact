contract SerializationTest {
    intFull: Int;
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;

    init() {
        self.intFull = 1;
        self.int8 = 2;
        self.uint8 = 3;
        self.int16 = 4;
        self.uint16 = 5;
    }
}
