contract LargeComposite {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    b1: Bool = true;
    b2: Bool = false;
    o1: Int? = null;
    o2: String? = null;
    init() {
        self.i1 = 10;
        self.i2 = 20;
        self.i3 = 30;
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
        self.b1 = false;
        self.b2 = true;
        self.o1 = 100;
        self.o2 = "opt";
    }
}