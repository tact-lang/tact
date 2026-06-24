contract ManyMixedFields {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int?;
    b2: Bool?;
    s2: String?;
    i3: Int;
    b3: Bool;
    s3: String;
    i4: Int?;
    b4: Bool?;
    s4: String?;
    i5: Int;
    b5: Bool;
    s5: String;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "x";
        self.i2 = null;
        self.b2 = null;
        self.s2 = null;
        self.i3 = 3;
        self.b3 = false;
        self.s3 = "y";
        self.i4 = null;
        self.b4 = null;
        self.s4 = null;
        self.i5 = 5;
        self.b5 = true;
        self.s5 = "z";
    }
}