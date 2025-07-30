contract MixedSerializedIntegers {
    a: Int as int8;
    b: Int as uint4;
    c: Int as uint16;
    d: Int as int32;

    init() {
        self.a = -5;
        self.b = 15;
        self.c = 65535;
        self.d = -100000;
    }
}
