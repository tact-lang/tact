contract DefaultMix {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
    }
}