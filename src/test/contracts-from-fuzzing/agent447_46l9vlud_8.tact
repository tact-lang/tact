struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Int; }
struct S4 { f4: Int; }
struct S5 { f5: Int; }

contract LongList {
    x1: S1;
    x2: S2;
    x3: S3;
    x4: S4;
    x5: S5;

    init() {
        self.x1 = S1{f1: 1};
        self.x2 = S2{f2: 2};
        self.x3 = S3{f3: 3};
        self.x4 = S4{f4: 4};
        self.x5 = S5{f5: 5};
    }
}