contract Defaults {
    a: Int = 7;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a = 0;
        self.b = true;
        self.c = 42;
        self.d = false;
    }
}