contract ExplicitDefaults {
    b: Bool = false;
    i: Int = 0;

    init() {
        self.b = false;
        self.i = 0;
    }

    receive() {}
}