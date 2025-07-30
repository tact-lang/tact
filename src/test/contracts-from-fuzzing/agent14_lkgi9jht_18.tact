contract TestContract {
    a: Int;
    b: Int;
    c: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }

    get fun sum(): Int {
        return self.a + self.b + self.c;
    }
}