contract MultiPrimitiveDefault {
    a: Int = 42;
    b: Bool = false;
    s: String = "hi";

    init() {
        self.a = 5;
        self.b = true;
        self.s = "bye";
    }
}