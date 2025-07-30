contract InitWithZeroes {
    big: Int as uint256 = 0;
    medium: Int as uint64 = 0;
    small: Int as int8 = 0;
    s: String = "";
    b: Bool = false;

    init() {
        self.big = 1;
        self.medium = 2;
        self.small = 3;
        self.s = "abc";
        self.b = true;
    }
}