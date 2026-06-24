contract InvalidDefaults {
    a: Int;
    b: Int;

    init() {
        self.a = 10;
        self.b = 20;
    }

    get fun sum(): Int {
        return self.a + self.b;
    }

    receive() {
        self.a = -1;
        self.b = -2;
    }
}