contract LargeLayout {
    val1: Int = 1;
    val2: Bool = true;
    val3: Int = 2;
    val4: Bool = false;
    val5: Int = 3;
    val6: Bool = true;
    val7: Int = 4;
    val8: Bool = false;
    val9: Int = 5;
    val10: Bool = true;

    receive() {
        self.val1 = self.val1;
    }
}