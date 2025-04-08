contract StringsAndInts {
    s1: String = "alpha";
    s2: String = "beta";
    n1: Int = 123;
    n2: Int = 456;

    init() {
        self.s2 = "changed";
    }
}