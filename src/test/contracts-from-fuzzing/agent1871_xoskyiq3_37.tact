contract SerialMix {
    a: Int as coins;
    b: Int;
    c: Int as uint4;

    init() {
        self.a = ton("1");
        self.b = -1;
        self.c = 7;
    }
}