contract DefaultsAndInit {
    a: Int;
    b: Bool = true;
    c: Int = 42;

    init() {
        self.a = 5;
    }

    receive() {
        self.a = self.a;
    }
}