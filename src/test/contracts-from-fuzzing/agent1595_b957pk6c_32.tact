// flat contract many optionals and strings
contract TestContract {
    s1: String?;
    s2: String?;
    s3: String;
    b1: Bool?;
    b2: Bool;
    i1: Int?;
    i2: Int;

    init() {
        self.s1=null; self.s2="y"; self.s3="z";
        self.b1=true; self.b2=false;
        self.i1=10; self.i2=20;
    }
}