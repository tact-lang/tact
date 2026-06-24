contract UnevenBitWidths {
    flag: Int as uint1;
    miniInt: Int as int7;
    medium: Int as uint51;

    init() {
        self.flag = 1;
        self.miniInt = 63;
        self.medium = 123456789;
    }
}