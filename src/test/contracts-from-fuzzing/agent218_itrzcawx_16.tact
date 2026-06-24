contract SerializationEdgeCase {
    a: Int as uint4; // 4 bits
    b: Int as uint4; // 4 bits
    c: Int as uint4; // 4 bits

    init() {
        self.a = 5;
        self.b = 10;
        self.c = 15;
    }
}