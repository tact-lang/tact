contract TestContract {
    a: Int = 0;
    b: Int;

    init() {
        self.b = 42;
    }

    receive() {
        self.a = self.a;
        self.b = self.b;
    }
}
