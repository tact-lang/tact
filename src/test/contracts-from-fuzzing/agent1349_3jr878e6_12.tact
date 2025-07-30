contract AllOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = null;
    d: Bool? = null;
    e: Address? = null;
    f: Cell? = null;

    receive() {
        self.a = 1;
        self.b = true;
        self.c = 2;
        self.d = false;
        self.e = null;
        self.f = null;
    }
}