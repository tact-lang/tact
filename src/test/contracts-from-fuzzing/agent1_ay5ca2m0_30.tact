contract WeirdDefaults {
    i: Int as int7 = -64;
    j: Int as int7 = 63;
    ui: Int as uint7 = 127;
    ub: Int as uint1 = 1;
    ib: Int as int1 = 0;

    init() {
        self.i = 0;
        self.j = 1;
        self.ui = 2;
        self.ub = 0;
        self.ib = -1;
    }
}
