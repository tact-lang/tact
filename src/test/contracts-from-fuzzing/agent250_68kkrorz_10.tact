contract ManyFieldsContract {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;

    init() {
        self.i1=1; self.i2=2; self.i3=3; self.i4=4; self.i5=5;
        self.b1=true; self.b2=false;
        self.s1="x"; self.s2="y";
    }
}