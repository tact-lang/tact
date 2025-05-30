contract TestContract {
    i1: Int = -1;
    i2: Int = 0;
    i3: Int = 1;
    i4: Int = 2;
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;

    init() {
        self.i1 = 10;
        self.i2 = 11;
        self.i3 = 12;
        self.i4 = 13;
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
        self.s4 = "w";
        self.b1 = false;
        self.b2 = true;
        self.b3 = false;
        self.b4 = true;
    }
    receive() {}
}