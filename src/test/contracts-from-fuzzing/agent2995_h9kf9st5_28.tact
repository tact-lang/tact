contract BackwardInit {
    a: Int;
    b: Int;

    init() {
        self.a = 3;
        self.b = self.a;
    }
}