contract VariousInts {
    i1: Int as int8;  
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint16;
    i5: Int as int32;
    i6: Int as uint32;
    init() {
        self.i1 = -10;
        self.i2 = 10;
        self.i3 = -1000;
        self.i4 = 1000;
        self.i5 = -100000;
        self.i6 = 100000;
    }
}