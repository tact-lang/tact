contract MixedSerializations {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint32;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
    
    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = true;
        self.e = null;
        self.f = "abc";
        self.g = null;
    }
}