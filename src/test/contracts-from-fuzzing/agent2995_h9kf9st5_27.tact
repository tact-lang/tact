contract ForwardInit {
    a: Int;
    b: Int;

    init() {
        self.b = 2;
        self.a = self.b;
    }
}