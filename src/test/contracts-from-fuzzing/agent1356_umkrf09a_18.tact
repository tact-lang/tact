contract DefaultOptional {
    n: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.n = 123;
        self.b = true;
        self.s = "x";
    }
}
