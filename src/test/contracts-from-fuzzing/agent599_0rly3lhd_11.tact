contract TestContract {
    a: Int as int8 = 0;
    b: Int as uint32 = 0;
    c: Int as int64 = 0;

    init() {
        self.a = 127;  // max int8
        self.b = 4294967295;  // max uint32
        self.c = -9223372036854775808;  // min int64
    }
}