contract BoolIntOptMix {
    b1: Bool;
    n1: Int;
    o1: Int?;
    b2: Bool;
    n2: Int;
    o2: Int?;

    init() {
        self.b1 = true;
        self.n1 = 1;
        self.o1 = null;
        self.b2 = false;
        self.n2 = 2;
        self.o2 = null;
    }
}