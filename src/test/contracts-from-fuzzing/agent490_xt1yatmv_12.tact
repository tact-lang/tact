// Long list of persistent fields, mixed types
contract LongList {
    i1: Int;
    b1: Bool;
    s1: String;
    f1: Address;
    i2: Int;
    b2: Bool;
    s2: String;
    f2: Address;
    i3: Int;
    b3: Bool;
    s3: String;
    f3: Address;
    i4: Int;
    b4: Bool;
    s4: String;
    f4: Address;
    i5: Int;
    b5: Bool;
    s5: String;
    f5: Address;

    init() {
        self.i1=1; self.b1=true; self.s1="a"; self.f1=myAddress();
        self.i2=2; self.b2=false; self.s2="b"; self.f2=myAddress();
        self.i3=3; self.b3=true; self.s3="c"; self.f3=myAddress();
        self.i4=4; self.b4=false; self.s4="d"; self.f4=myAddress();
        self.i5=5; self.b5=true; self.s5="e"; self.f5=myAddress();
    }
}