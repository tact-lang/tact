contract SerializationEdges {
    a: Int as int1;       // minimum size signed int
    b: Int as int257;     // maximum size signed int
    c: Int as uint1;      // minimum size unsigned int
    d: Int as uint256;    // maximum size unsigned int

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }
}