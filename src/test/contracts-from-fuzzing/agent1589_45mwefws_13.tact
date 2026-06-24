contract SerializeSize {
    i257: Int;          // default serialized as int257
    i64: Int as int64; // explicit 64 bits
    u4: Int as uint4;  // explicit unsigned 4 bits

    init() {
        self.i257 = 0;
        self.i64 = 1;
        self.u4 = 2;
    }
}