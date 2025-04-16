contract MixedSerialTypes {
    a: Int as uint8;
    b: Int as int64;
    c: Int as int257;

    init() {
        self.a=255;
        self.b=1234567;
        self.c=9081726354;
    }
}