struct SChild { scc: Int; }
struct SParent1 { sc1: SChild; }
struct SParent2 { sc2: SChild; }

contract MultiNested {
    p1: SParent1;
    p2: SParent2;

    init() {
        self.p1 = SParent1 { sc1: SChild { scc: 1 } };
        self.p2 = SParent2 { sc2: SChild { scc: 2 } };
    }
}