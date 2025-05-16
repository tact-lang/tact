contract ExplicitIntSerialization {
    a: Int as uint8 = 0;
    b: Int as int16 = 0;
    c: Int as uint32 = 0;
    d: Int as int64 = 0;
    e: Int as uint120 = 0;
    f: Int = 0;
    
    init() {
        self.f = 42;
    }
}