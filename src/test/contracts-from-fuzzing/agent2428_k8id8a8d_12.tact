contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a = 2;
        self.b = false;
        self.c = 5;
        self.d = true;
    }
}