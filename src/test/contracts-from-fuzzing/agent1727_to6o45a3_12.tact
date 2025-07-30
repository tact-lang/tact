// minimal contract with many fields defaulted to zero/null
contract ManyDefaults {
    i1: Int = 0;
    i2: Int = -1;
    b1: Bool = false;
    s1: String = "";
    o1: Int?;
    o2: Bool?;
    o3: String?;

    receive() {
        self.i1 = 1;
        self.i2 = 2;
        self.b1 = true;
        self.s1 = "x";
        self.o1 = 9;
        self.o2 = false;
        self.o3 = "y";
    }
}