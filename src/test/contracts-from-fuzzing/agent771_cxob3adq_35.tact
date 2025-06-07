contract EdgeBoolIntStr {
    b: Bool = true;
    i: Int = 9001;
    s: String = "init";

    init() {
        self.b = false;
        self.i = -9001;
        self.s = "done";
    }
}