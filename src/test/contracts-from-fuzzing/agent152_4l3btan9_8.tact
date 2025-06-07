contract TestContract {
    val1: Int as uint1;   // 1 bit (0 or 1)
    val2: Int as uint8;   // 8 bits
    val3: Int as int16;   // 16 bits
    val4: Int as int257;  // 257 bits
    flag: Bool;           // 1 bit
    text: String;

    init() {
        self.val1 = 1;
        self.val2 = 255;
        self.val3 = -1000;
        self.val4 = 123456789;
        self.flag = false;
        self.text = "hello";
    }
}
