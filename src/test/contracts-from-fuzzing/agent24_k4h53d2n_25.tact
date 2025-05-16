contract DefaultBoolInt {
    b: Bool = true;
    i: Int = 123;

    init() {
        self.b = false;
        self.i = 321;
    }
}