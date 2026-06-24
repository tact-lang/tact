struct ChildA { p: Int; }
struct ChildB { q: Int; }

struct Parent {
    chA: ChildA;
    chB: ChildB;
    optionalVal: Int?;
}

contract ComplexNested {
    storage: Parent;
    init() {
        self.storage = Parent{
            chA: ChildA{ p: 1 },
            chB: ChildB{ q: 2 },
            optionalVal: null
        };
    }
}