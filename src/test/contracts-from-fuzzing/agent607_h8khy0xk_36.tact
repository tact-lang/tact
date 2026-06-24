contract SerialDiffers {
    a: Int as int8;
    b: Int as int64;
    c: Int as int256;

    init() {
        self.a=12;
        self.b=34567;
        self.c=8910111213;
    }
}