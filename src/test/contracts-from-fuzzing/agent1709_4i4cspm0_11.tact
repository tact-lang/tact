contract ManyOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    i1: Int?;
    i2: Int?;
    i3: Int?;

    init() {
        self.s1=null; self.s2=null; self.s3="x";
        self.b1=true; self.b2=null; self.b3=false;
        self.i1=1; self.i2=null; self.i3=3;
    }
}