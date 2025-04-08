contract TestContract {
    val1: Int as uint8;
    val2: Int as int16;
    val3: Int as uint4;

    init() {
        self.val1 = 255;
        self.val2 = -32768;
        self.val3 = 15;
    }
}