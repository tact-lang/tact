contract TestContract {
    int1: Int = 1;
    bool1: Bool = true;
    str1: String = "one";
    int2: Int = 2;
    bool2: Bool = false;
    str2: String = "two";

    init() {
        self.int1 = 11;
        self.bool1 = false;
        self.str1 = "ONE";
        self.int2 = 22;
        self.bool2 = true;
        self.str2 = "TWO";
    }
}