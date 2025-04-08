struct L1 { a: Int; }
struct L2 { a: Int; }
struct L3 { a: Int; }
struct L4 { a: Int; }
struct L5 { a: Int; }

struct DeepTree {
    l1: L1;
    l2: L2;
    l3: L3;
    l4: L4;
    l5: L5;
}

contract Test {
    dt: DeepTree;

    init() {
        self.dt = DeepTree{
            l1: L1{a:1},
            l2: L2{a:2},
            l3: L3{a:3},
            l4: L4{a:4},
            l5: L5{a:5}
        };
    }
}
// test many nested distinct struct types under one storage field