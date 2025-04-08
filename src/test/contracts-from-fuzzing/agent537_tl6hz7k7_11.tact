contract TestContract {
    var1: Int as int64;
    var2: Int as uint64;
    var3: Int as int32;
    var4: Int as uint32;

    init() {
        self.var1 = 9223372036854775807; // max int64
        self.var2 = 18446744073709551615;// max uint64
        self.var3 = 2147483647;          // max int32
        self.var4 = 4294967295;          // max uint32
    }

    receive() {
        self.var1 = -9223372036854775808; // min int64
        self.var2 = 0;                    // min uint64
        self.var3 = -2147483648;          // min int32
        self.var4 = 0;                    // min uint32
    }
}
