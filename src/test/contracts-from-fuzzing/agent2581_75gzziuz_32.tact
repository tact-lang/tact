contract DefaultsAndInit {
    a: Int = 1;
    b: Bool;

    init() {
        self.b = false;
        self.a = 5;
    }
}
