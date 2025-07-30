// Contract with lots of primitive state variables
contract ManyPrimitiveTypes {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
    s3: String;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.s1 = "a";
        self.s2 = "b";
        self.s3 = "c";
    }
}