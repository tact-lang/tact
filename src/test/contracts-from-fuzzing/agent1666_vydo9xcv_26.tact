contract ZeroDefaults {
    a: Int;
    b: Bool;
    c: Int as uint8;

    init() {
        self.a = 0;
        self.b = false;
        self.c = 0;
    }
}