struct S1 { x: Int; }
struct S2 { x: Int; }
struct S3 { x: Int; }
struct S4 { x: Int; }
struct S5 { x: Int; }

struct Bundle {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract CC {
    all: Bundle;
    init() {
        self.all = Bundle{
            s1:S1{x:1}, s2:S2{x:2}, s3:S3{x:3}, s4:S4{x:4}, s5:S5{x:5}
        };
    }
}