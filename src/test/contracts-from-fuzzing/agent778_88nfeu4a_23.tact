contract MixedBitsDefaults {
    a: Int as int8 = -5;
    b: Int as uint8 = 240;
    c: Bool = true;
    d: Int as coins = 5000;

    init() {
        self.a = -5;
        self.b = 250;
        self.c = false;
        self.d = 7500;
    }
}