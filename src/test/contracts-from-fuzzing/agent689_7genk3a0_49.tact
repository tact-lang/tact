contract DefaultsOnly {
    a: Int = 0;
    b: Bool = true;
    s: String = "foo";
    init() {
        self.a = 3;
        self.b = false;
        self.s = "bar";
    }
}