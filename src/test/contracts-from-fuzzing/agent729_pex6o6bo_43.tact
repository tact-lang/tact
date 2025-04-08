contract MaxSmallInts {
    i4: Int as uint4;
    i8: Int as uint8;
    i16: Int as uint16;
    i32: Int as uint32;
    
    init() {
        self.i4 = 15;
        self.i8 = 255;
        self.i16 = 65535;
        self.i32 = 4294967295;
    }
    receive() {}
}