contract IntVarSizes {
    i1: Int as uint4;
    i2: Int as uint8;
    i3: Int as uint16;
    i4: Int as uint32;
    i5: Int as uint64;
    
    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
    }
}