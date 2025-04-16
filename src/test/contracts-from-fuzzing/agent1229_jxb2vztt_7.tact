contract DefaultsMix {
    a: Int = 1;
    b: Bool;
    c: String = "init";
    d: Int;

    init() {
        self.b = true;
        self.d = 42;
    }
}
