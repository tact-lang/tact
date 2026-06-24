contract LargeInts {
    a: Int as uint248 = 0;
    b: Int as int251 = -1;

    init() {
        self.a = 123;
        self.b = -123;
    }
}