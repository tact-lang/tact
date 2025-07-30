contract SerializeOverflowInit {
    small: Int as uint4; // 0-15

    init() {
        self.small = -1;
        self.small = 500;
        self.small = 3; // last assignment OK
    }
}