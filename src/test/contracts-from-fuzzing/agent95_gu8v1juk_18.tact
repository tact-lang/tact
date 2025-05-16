contract TestContract {
    flag1: Bool;
    flag2: Bool;
    small: Int as uint3;
    flag3: Bool;
    mid: Int as uint8;
    flag4: Bool;
    large: Int;

    init() {
        self.flag1 = true;
        self.flag2 = false;
        self.small = 5;
        self.flag3 = true;
        self.mid = 100;
        self.flag4 = false;
        self.large = 123456789;
    }
}