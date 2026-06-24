contract DefaultAssignment {
    a: Int = 42;
    s: String = "hi";
    b: Bool = true;

    init() {
        self.a = 5;
        self.s = "ok";
        self.b = false;
    }
}