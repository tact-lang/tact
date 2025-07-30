contract EdgeZeros {
    a: Int as uint8 = 0;
    b: Int as uint16 = 0;
    c: Int as int8 = 0;
    d: Int as int16 = 0;
    e: Bool = false;
    s: String = "";
    
    init() {
        self.a = 255;
        self.b = 65535;
        self.c = -128;
        self.d = -32768;
        self.e = true;
        self.s = "nonempty";
    }

    receive() {
        let _ = self.a + self.b + self.c + self.d;
    }
}