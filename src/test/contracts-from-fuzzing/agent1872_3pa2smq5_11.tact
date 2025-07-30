struct A1 { v1: Int; }
struct A2 { v2: Int; }
struct A3 { v3: Int; }

struct Combo {
    aa: A1;
    bb: A2;
    cc: A3;
}

contract NestedMultipleStructs {
    val: Combo;

    init() {
        self.val = Combo{
            aa: A1{v1:1},
            bb: A2{v2:2},
            cc: A3{v3:3},
        };
    }
}