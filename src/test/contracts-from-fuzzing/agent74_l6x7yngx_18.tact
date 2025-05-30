contract LargeTypes {
    bigInt: Int as int257;
    midInt: Int as int128;
    smallInt: Int as int16;
    tinyInt: Int as int1;

    init() {
        self.bigInt = 1;
        self.midInt = 2;
        self.smallInt = 3;
        self.tinyInt = 0;
    }
}