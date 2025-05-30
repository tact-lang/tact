contract SerialOpt {
    a: Int as uint8;
    b: Int?;
    c: Int? as uint16;
    d: Int as int128;
    
    init() {
        self.a = 5;
        self.b = null;
        self.c = null;
        self.d = -100;
    }
}
