contract DefaultsAndInit {
    a: Int = 7;
    b: Int;

    init() {
        self.b = 9;
        self.a = 10;
    }
}