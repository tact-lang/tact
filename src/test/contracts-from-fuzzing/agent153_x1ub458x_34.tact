struct SInner { x: Int; y: Bool; }

struct SOuter { 
    s: SInner;
    z: Int;
}

contract AssignInnerField {
    f: SOuter;

    init() {
        self.f = SOuter { s: SInner { x: 1, y: false }, z: 42 };
        self.f.s.x = 999;
    }
}