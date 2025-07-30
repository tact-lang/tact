contract TinyBitfields {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    tinyVal: Int as uint3;
    smallVal: Int as uint6;

    init() {
        self.flag1 = false;
        self.flag2 = false;
        self.flag3 = true;
        self.tinyVal = 3;
        self.smallVal = 15;
    }
}