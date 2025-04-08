struct S1 { f1: Int; }
struct S2 { f2: Int; }
struct S3 { f3: Bool; }
struct S4 { f4: Bool; }
struct S5 { f5: String; }
struct S6 { f6: String; }

struct Big {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;
    f: S6;
}

contract WideNested {
    data: Big;

    init() {
        self.data = Big{
            a: S1{f1:1},
            b: S2{f2:2},
            c: S3{f3:true},
            d: S4{f4:false},
            e: S5{f5:"abc"},
            f: S6{f6:"def"}
        };
    }
}