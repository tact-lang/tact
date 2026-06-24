contract TrailingZeroesFields {
    x1: Int as uint8;
    x2: Int as uint64;
    x3: Int as int257;
    x4: Int as int1;
    x5: Int as uint1;
    
    init() {
        self.x1 = 0;
        self.x2 = 0;
        self.x3 = 0;
        self.x4 = 0;
        self.x5 = 0;
    }
}