contract TestContract {
    int1: Int;
    int2: Int as int64;
    int3: Int as uint8;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;

    init() {
        self.int1 = 100;
        self.int2 = 64;
        self.int3 = 255;  // deliberately over max uint8 (should be truncated post compute phase)
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "hello";
        self.str2 = "world";
    }
}