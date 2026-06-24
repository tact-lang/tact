contract LargeDefaultInt {
    a: Int = 1000000000000;
    b: Int = -999999999999;

    init() {
        self.a = 1;
        self.b = -1;
    }
}