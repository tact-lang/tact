contract ManyFields {
    i1: Int;
    s1: String;
    b1: Bool;
    o1: Int?;
    i2: Int;
    s2: String;
    b2: Bool;
    o2: Bool?;
    i3: Int;
    s3: String;
    b3: Bool;
    o3: String?;

    init() {
        self.i1=1;self.s1="a";self.b1=true;self.o1=null;
        self.i2=2;self.s2="b";self.b2=false;self.o2=true;
        self.i3=3;self.s3="c";self.b3=true;self.o3=null;
    }
}
