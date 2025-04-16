contract OptStructInInit {
    a: Int;
    b: Bool?;
    init() {
        self.a = 42;
        self.b = null;
    }
}