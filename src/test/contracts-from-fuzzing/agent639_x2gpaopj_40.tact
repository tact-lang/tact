contract OptIntVarSizes {
    i1: Int? as uint4;
    i2: Int? as uint8;
    i3: Int? as uint16;
    i4: Int? as uint32;
    i5: Int? as uint64;
    
    init() {
        self.i1 = null;
        self.i2 = null;
        self.i3 = null;
        self.i4 = null;
        self.i5 = null;
    }
}