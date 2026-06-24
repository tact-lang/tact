contract TestManyBools {
    val1: Bool = false;
    val2: Bool = false;
    val3: Bool = false;
    val4: Bool = false;
    val5: Bool = false;
    val6: Bool = false;
    val7: Bool = false;
    val8: Bool = false;
    val9: Bool = false;
    val10: Bool = false;

    init() {
        self.val1 = true;
        self.val2 = false;
        self.val3 = true;
        self.val4 = false;
        self.val5 = true;
        self.val6 = false;
        self.val7 = true;
        self.val8 = false;
        self.val9 = true;
        self.val10 = false;
    }

    receive() {
        let _ = self.val1;
    }
}