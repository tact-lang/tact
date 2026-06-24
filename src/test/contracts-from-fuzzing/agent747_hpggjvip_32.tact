contract DefaultsAndSerialization {
    a: Int as uint8 = 250;
    b: Int as int16 = -20000;
    c: Bool = true;
    d: String = "data";

    init() {
        self.a = 255;
        self.b = -22222;
        self.c = false;
        self.d = "changed";
    }
}