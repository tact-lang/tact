contract SerializePrimitivesOptimization {
    i: Int as uint8;
    j: Int as int16;
    k: Int as uint32;
    l: Int as int256;

    init() {
        self.i = 1;
        self.j = -1;
        self.k = 42;
        self.l = -42;
    }
}