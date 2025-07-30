contract TestContract {
    a: Int;
    b: Int;

    init() {
        self.a = 100;
        self.b = self.a + 200;
    }
}