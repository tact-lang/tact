contract Test {
    a: Int as uint8;
    b: Int as uint4; 

    init() {
        self.a = 300; // too big, should break at runtime, not compile
        self.a = 25;  // ok
        self.b = 20;  // ok
        self.b = 500; // too big, should break at runtime, not compile
        self.b = 12;  // ok
    }
}