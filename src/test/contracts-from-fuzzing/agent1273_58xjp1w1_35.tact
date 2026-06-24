contract CombinedDefaults {
    i: Int = 2;
    s: String = "str";
    b: Bool = true;

    init() {
        self.i = 10;
        self.s = "hello";
        self.b = false;
    }
}