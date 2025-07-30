contract ChainOfOptionals {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
    d: Int? = null;

    receive() {
        self.a = 1;
        self.b = self.a;
        self.c = self.b;
        self.d = self.c;
    }
}
