contract Test {
    a: Int = 1;
    b: Bool? = null;

    init() {
        self.a = 2;
    }

    receive() {
        self.b = true;
    }
}