contract ZeroDefaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";

    init() {
        self.i = 100;
        self.b = true;
        self.s = "updated";
    }
}