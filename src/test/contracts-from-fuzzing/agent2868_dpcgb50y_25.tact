contract MixIntsSerialization {
    i_default: Int;
    i_u32: Int as uint32;
    i_i64: Int as int64;

    init() {
        self.i_default = 1;
        self.i_u32 = 2;
        self.i_i64 = 3;
    }
}