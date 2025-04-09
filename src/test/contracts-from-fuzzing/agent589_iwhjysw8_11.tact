// Large flat contract, many mixed types, no structs
contract FlatTypes {
    i1: Int;
    s1: String;
    b1: Bool;
    i2: Int;
    s2: String;
    b2: Bool;
    i3: Int;
    s3: String;
    b3: Bool;
    i4: Int;
    s4: String;
    b4: Bool;

    init() {
        self.i1 = 1;
        self.s1 = "a";
        self.b1 = true;
        self.i2 = 2;
        self.s2 = "b";
        self.b2 = false;
        self.i3 = 3;
        self.s3 = "c";
        self.b3 = true;
        self.i4 = 4;
        self.s4 = "d";
        self.b4 = false;
    }
}
