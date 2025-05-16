contract UnitDefaultEdge {
    a: Int as uint4 = 15;
    b: Int as int8 = -128;
    
    init() {
        self.a = 7;
        self.b = 127;
    }
}