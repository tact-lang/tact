struct N1 { v1: Int }
struct N2 { v2: Int }
struct N3 { v3: Int }
struct HugeNest {
    n1: N1;
    n2: N2;
    n3: N3;
}
contract TestMultiNested {
    p: HugeNest;
    init() {
        self.p = HugeNest{
            n1: N1{v1:1},
            n2: N2{v2:2},
            n3: N3{v3:3}
        };
    }
}