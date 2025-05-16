contract MixSmallSerialized {
    a: Int as int8 = -10;
    b: Int as uint8 = 250;
    c: Bool = true;
    d: Int as int16 = -3000;
    e: Int as uint16 = 60000;

    init() {
        self.a = -10;
        self.b = 250;
        self.c = false;
        self.d = -3000;
        self.e = 60000;
    }
}