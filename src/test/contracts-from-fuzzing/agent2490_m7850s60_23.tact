contract MixedSerializationFormats {
    a: Int as uint4;
    b: Int as int12;
    c: Int as uint64;
    d: Int as int8;

    init() {
        self.a = 5;
        self.b = 10;
        self.c = 100;
        self.d = -7;
    }
}