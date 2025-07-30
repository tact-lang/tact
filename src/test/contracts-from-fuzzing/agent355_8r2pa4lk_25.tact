contract UseSerializations {
    small: Int as uint8;
    big: Int as int257;
    flag: Bool;

    init() {
        self.small = 255;
        self.big = 123456789012345678901234567890;
        self.flag = true;
    }
}