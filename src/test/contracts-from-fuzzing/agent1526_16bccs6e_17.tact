contract MixedSerialization {
    i8: Int as uint8;
    i16: Int as int16;
    i260: Int as int257;
    flag: Bool;
    s: String;

    init() {
        self.i8 = 255;
        self.i16 = -200;
        self.i260 = -1000;
        self.flag = true;
        self.s = "mix";
    }
}