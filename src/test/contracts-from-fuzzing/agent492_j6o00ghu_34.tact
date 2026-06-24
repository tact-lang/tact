contract InitDefaultsAndOptions {
    a: Int = 1;
    b: Int? = null;

    init() {
        self.a = 42;
        self.b = null;
    }
}
