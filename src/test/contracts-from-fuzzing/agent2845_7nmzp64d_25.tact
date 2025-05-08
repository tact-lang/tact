contract ChainedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;

    init() {
        self.a = 2;
        self.b = true;
        self.c = "hello";
        self.d = 5;
    }
}