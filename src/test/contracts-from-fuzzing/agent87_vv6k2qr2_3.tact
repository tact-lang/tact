struct S {
    x: Int;
}

contract NestedLayer3 {
    f: L1;

    init() {
        self.f = L1{
            l2: L2{
                l3: L3{ s: S{ x: 42 } }
            }
        };
    }
}

struct L1 { l2: L2; }
struct L2 { l3: L3; }
struct L3 { s: S; }
