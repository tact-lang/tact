struct S1 { a: Int; }
struct S2 { b: Int?; }
struct S3 { c: Bool; }
struct S4 { d: Bool?; }

struct Top {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            f1: S1{a:11},
            f2: S2{b:null},
            f3: S3{c:true},
            f4: S4{d:false},
        };
    }
}