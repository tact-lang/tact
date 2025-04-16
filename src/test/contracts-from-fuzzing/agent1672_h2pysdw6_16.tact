contract DefaultBeforeInit {
    a: Int = 5;
    b: Bool = true;

    init() {
        self.a = 10;
        self.b = false;
    }
}
