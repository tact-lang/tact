contract TestContract {
    i1: Int = 1;
    i2: Int? = null;
    b1: Bool = false;
    b2: Bool? = null;
    s1: String = "";
    s2: String? = null;

    init() {
        self.i1 = 10;
        self.i2 = 20;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "aaa";
        self.s2 = "bbb";
    }
}