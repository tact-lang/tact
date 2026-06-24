contract MaxBitfields {
    small1: Int as uint1;
    small2: Int as uint1;
    small3: Int as uint1;
    small4: Int as uint1;
    small5: Int as uint1;
    init() {
        self.small1 = 1;
        self.small2 = 0;
        self.small3 = 1;
        self.small4 = 0;
        self.small5 = 1;
    }
    receive() {}
}