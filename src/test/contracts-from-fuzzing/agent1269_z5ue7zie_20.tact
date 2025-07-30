contract TestContract {
    a: Int;
    b: Int;

    init() {
        self.b = 50;
        self.a = self.b + 10;
    }
}