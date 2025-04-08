contract LargePrimitiveFields {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "a";
        self.s2 = "b";
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
    }
}