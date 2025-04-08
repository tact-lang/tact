contract TestContract {
    val1: Int;
    val2: Int as uint8;
    val3: Int as int32;
    val4: Int as uint64;
    val5: Int as coins;
    flag1: Bool;
    text: String;

    init() {
        self.val1 = 123;
        self.val2 = 12;
        self.val3 = -99;
        self.val4 = 123456789;
        self.val5 = ton("1");
        self.flag1 = true;
        self.text = "Serialization";
    }
}