contract SerializeSizes {
    val1: Int as int8;
    val2: Int as uint8;
    val3: Int as int257;
    val4: Int as uint256;

    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
        self.val4 = 4;
    }
}