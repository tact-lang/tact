contract BoolIntMix {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
    b3: Bool;

    init() {
        self.b1 = false;
        self.i1 = 1;
        self.b2 = true;
        self.i2 = 2;
        self.b3 = false;
    }

    receive() {}
}