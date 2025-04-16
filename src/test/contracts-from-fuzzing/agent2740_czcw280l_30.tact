struct P1 { x: Int; }
struct P2 { x: Int; }

contract SameFieldDiffStruct {
    p1: P1;
    p2: P2;

    init() {
        self.p1 = P1{ x: 10 };
        self.p2 = P2{ x: 20 };
    }
}