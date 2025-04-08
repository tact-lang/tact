contract OverrideFieldDefault {
    a: Int = 1;

    init() {
        self.a = 5;
    }
}