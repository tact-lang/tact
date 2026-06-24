contract SerializeIntMixed {
    val1: Int as int128;
    val2: Int as uint120;
    val3: Int;  
    val4: Int as uint60;

    init() {
        self.val1 = -1000;
        self.val2 = 1000;
        self.val3 = 9999999;
        self.val4 = 500;
    }
}