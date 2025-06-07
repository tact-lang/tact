contract OutOfOrder {
    b: Bool = false;
    a: Int = 5;

    init() {
        self.b = true;
        self.a = 42;
    }
}