struct S1 {
    a1:Int; a2:Int; a3:Int; a4:Int; a5:Int;
}

struct S2 {
    b1:Int; b2:Int; b3:Int; b4:Int; b5:Int;
}

struct S3 {
    c1:Int; c2:Int; c3:Int; c4:Int; c5:Int;
}

contract TestContract {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{a1:1,a2:2,a3:3,a4:4,a5:5};
        self.s2 = S2{b1:6,b2:7,b3:8,b4:9,b5:10};
        self.s3 = S3{c1:11,c2:12,c3:13,c4:14,c5:15};
    }

    receive() {}
}