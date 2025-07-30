contract WeirdOrder {
    a: Bool = true;
    b: Int = 2;
    c: String = "hi";
    d: Bool? = null;
    e: Int? = null;

    init() {
        self.d = true;
        self.e = 42;
    }
}
