struct Inner {
    f1: Int;
    f2: Bool;
}

contract ManyPersistentVars {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    sub: Inner;

    init() {
        self.i1=1; self.i2=2; self.i3=3; self.i4=4;
        self.b1=true; self.b2=false;
        self.s1="x"; self.s2="y";
        self.sub = Inner{ f1:5, f2:true };
    }
}