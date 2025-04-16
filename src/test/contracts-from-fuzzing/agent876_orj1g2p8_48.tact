contract OptionalsAndSerialization {
    a: Int? as uint4;
    b: Int? as int5;
    c: Int? as uint8;
    d: Int? as int16;

    init() {
        self.a = null;
        self.b = -2;
        self.c = 3;
        self.d = null;
    }
}