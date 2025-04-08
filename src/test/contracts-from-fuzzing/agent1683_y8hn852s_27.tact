contract LargeNumberDefaults {
    a: Int = 0;
    b: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    init() {
        self.a = -123456789;
        self.b = 123456789;
    }

    receive() {
        self.a = 9999;
        self.b = -9999;
    }
}