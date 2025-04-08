struct S {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract ManyIntStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1 = S{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.s2 = self.s1;
        self.s3 = self.s1;
        self.s4 = self.s1;
        self.s5 = self.s1;
    }
}