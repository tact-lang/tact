contract Test8 {
    v1: Int as uint32;
    v2: Int as int8;
    v3: Int as coins;
    
    init() {
        self.v1 = 10;
        self.v2 = -5;
        self.v3 = ton("1");
    }
}