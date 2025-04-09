struct A1 { a: Int; }
struct A2 { a: Int; }
struct A3 { a: Int; }
struct A4 { a: Int; }
struct A5 { a: Int; }

struct LongNest {
    n1: A1;
    n2: A2;
    n3: A3;
    n4: A4;
    n5: A5;
}

contract WideNest {
    w: LongNest;
    init() {
        self.w = LongNest{
            n1: A1{a:1},
            n2: A2{a:2},
            n3: A3{a:3},
            n4: A4{a:4},
            n5: A5{a:5},
        };
    }
}