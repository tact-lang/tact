struct S1 {
    n: Int;
}
struct S2 {
    n: Int;
}
struct S3 {
    n: Int;
}
struct S4 {
    n: Int;
}
struct S5 {
    n: Int;
}

contract ManyNested {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    init() {
        self.s1 = S1{n:1};
        self.s2 = S2{n:2};
        self.s3 = S3{n:3};
        self.s4 = S4{n:4};
        self.s5 = S5{n:5};
    }
}