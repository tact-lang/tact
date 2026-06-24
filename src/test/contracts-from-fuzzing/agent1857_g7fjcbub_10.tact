contract MultiManyFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;

    init() {
        self.int1=1; self.int2=2; self.int3=3; self.int4=4; self.int5=5;
        self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
        self.s1="a"; self.s2="b"; self.s3="c"; self.s4="d"; self.s5="e";
    }
}