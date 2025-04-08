contract TestContract {
    val1: Int = 10;
    val2: Int as uint8 = 255;
    val3: Int as int16 = -1234;
    val4: Bool = true;
    val5: String = "foo";

    init() {
        self.val1 = 100;
        self.val2 = 99;
        self.val3 = -99;
        self.val4 = false;
        self.val5 = "bar";
    }
}