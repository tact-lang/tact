contract TestContract {
    int1: Int = 0;
    int2: Int = -1;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "alpha";
    str2: String = "beta";

    init() {
        self.int1 = 42;
        self.int2 = -42;
        self.bool1 = false;
        self.bool2 = true;
        self.str1 = "gamma";
        self.str2 = "delta";
    }
}
