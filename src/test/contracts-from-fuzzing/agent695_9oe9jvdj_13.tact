struct S1 { x: Int; }
struct S2 { y: Int; }

contract TupleStructs {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{x:1};
        self.f2 = S2{y:2};
    }
}