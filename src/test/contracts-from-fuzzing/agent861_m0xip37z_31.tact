contract InitDefaultsVsAssign {
    a: Int = 5;
    b: Bool = false;

    init() {
        self.a = 10;
        self.b = true;
    }
}
