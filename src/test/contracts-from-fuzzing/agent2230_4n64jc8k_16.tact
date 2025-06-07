contract DefaultIntVariants {
    val1: Int = 0;
    val2: Int as uint32 = 0;
    val3: Int as int8 = -1;
    val4: Int as uint4 = 1;

    init() {
        self.val1 = 100;
        self.val2 = 200;
        self.val3 = -5;
        self.val4 = 8;
    }
}