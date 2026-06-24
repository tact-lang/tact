contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: Int? = null;
    val4: Bool? = null;
    val5: Int as uint8 = 200;
    val6: Int as int16 = -32000;

    init() {
        self.val1 = 123;
        self.val2 = false;
        self.val3 = 555;
        self.val4 = true;
        self.val5 = 250;
        self.val6 = -12345;
    }
}
