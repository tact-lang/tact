contract MixPacked {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Bool;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 9999;
        self.d = true;
    }
}