contract IntSerialization {
    a: Int as int64 = 0;
    b: Int as uint4 = 1;
    
    init() {
        self.a = -42;
        self.b = 8;
    }
}