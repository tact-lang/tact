struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }

struct Combo {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
}

contract MultiStruct {
    val: Combo;

    init() {
        self.val = Combo{
            a: S1{f1:1},
            b: S2{f2:2},
            c: S3{f3:3},
            d: S4{f4:4}
        };
    }
}
