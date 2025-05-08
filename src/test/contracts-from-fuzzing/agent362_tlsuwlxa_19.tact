contract TestContract {
    val1: Int as int64;
    val2: Int as int128;
    val3: Int as uint16;
    val4: Int as uint4;

    init() {
        self.val1 = (1 << 63) - 1;  // max int64
        self.val2 = (1 << 127) -1;  // max int128
        self.val3 = (1 << 16) -1;   // max uint16
        self.val4 = 15;             // max uint4
    }

    receive() {
        self.val1 = -((1 << 63));           // min int64
        self.val2 = -((1 << 127));          // min int128
        self.val3 = 0;
        self.val4 = 0;
    }
}