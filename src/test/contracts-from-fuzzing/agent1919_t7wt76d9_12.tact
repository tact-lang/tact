contract TestContract {
    a: Int as int8 = -10;
    b: Int as uint8 = 250;
    c: Int as int16 = -300;
    d: Int as uint16 = 60000;
    e: Int as int32 = -2000000000;
    f: Int as uint32 = 4000000000;
    g: Int as int64 = -9000000000000000000;
    h: Int as uint64 = 18000000000000000000;
    
    init() {
        self.a = 0;
    }
}