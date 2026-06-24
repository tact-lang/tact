contract ZeroDefaults {
    a: Int;
    b: Bool;
    c: Bool?;

    init() {
        self.a = 0;
        self.b = false;
        self.c = null;
    }
}