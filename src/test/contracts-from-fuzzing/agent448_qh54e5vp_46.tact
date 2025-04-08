contract ZeroDefaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";

    init() {
        self.i = 123;
        self.b = true;
        self.s = "hi";
    }
}