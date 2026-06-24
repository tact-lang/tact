contract Test {
    small: Int as int1 = 0;    // bits: 1
    med: Int as int128 = 100; // bits:128
    big: Int = 1000;          // bits:257

    init() {
        self.small = 1;
        self.med = -100;
        self.big = -1000;
    }
}
