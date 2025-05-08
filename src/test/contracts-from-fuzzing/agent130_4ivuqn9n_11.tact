contract OnlyOptionals {
    a: Int? = null;
    b: Address? = null;
    c: Cell? = null;
    d: Bool? = null;
    e: String? = null;

    receive() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}