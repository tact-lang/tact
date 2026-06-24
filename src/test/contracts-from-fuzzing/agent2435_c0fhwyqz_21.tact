contract DefaultAndInit {
    a: Int = 0;
    b: Bool = false;

    init() {
        self.a = 42;
        self.b = true;
    }
}