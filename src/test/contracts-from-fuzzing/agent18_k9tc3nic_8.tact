struct S1 { a: Int; }
struct S2 { a: Int; b: Int; }
struct S3 { a: Int; b: Int; c: Int; }
struct S4 { a: Int; b: Int; c: Int; d: Int; }

contract TestContract {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{a:2,b:3};
        self.f3 = S3{a:4,b:5,c:6};
        self.f4 = S4{a:7,b:8,c:9,d:10};
    }
}