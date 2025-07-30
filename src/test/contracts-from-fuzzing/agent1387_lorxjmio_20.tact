contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = 42;
        self.d = false;
    }
}