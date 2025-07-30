contract IntsWithDefaults {
    num1: Int = 1;
    num2: Int = 2;
    num3: Int = 3;
    num4: Int = 4;

    init() {
        self.num2 = 22;
        self.num3 = 33;
    }
}