contract MultipleOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;

    receive() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = 42;
    }
}