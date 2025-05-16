contract SerializeEdge {
    a: Int as uint3;
    b: Int as int5;

    init() {
        self.a = 7; // 3 bits
        self.b = -8; // 5 bits
    }
}
