contract MixSerializationWithOptionals {
    a: Int as uint4;
    b: Int?;
    c: Int as int16;
    d: Bool?;

    init() {
        self.a = 8;
        self.b = null;
        self.c = -123;
        self.d = true;
    }
}