contract ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a = 100;
        self.b = true;
        self.c = 200;
        self.d = false;
    }
}