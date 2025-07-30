contract OutOfOrderAssign {
    a: Int;
    b: Int = 2;
    c: Int;
    d: Int = 4;

    init() {
        self.c = self.b + 1;
        self.a = self.d + 1;
    }
}