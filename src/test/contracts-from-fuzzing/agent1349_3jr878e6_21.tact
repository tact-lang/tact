contract OptionMix {
    i1: Int? = null;
    b1: Bool? = true;
    i2: Int? = null;
    b2: Bool? = true;
    s: String? = null;

    receive() {
        self.i1 = 5;
        self.b1 = false;
        self.i2 = 10;
        self.b2 = true;
        self.s = "hello";
    }
}