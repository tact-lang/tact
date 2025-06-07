struct OneChild {
    c: Int;
}

struct AlsoChild {
    d: Int;
}

struct Parent {
    s1: OneChild;
    s2: AlsoChild;
}

contract MultiNestedDiffStructs {
    root: Parent;
    init() {
        self.root = Parent{
            s1: OneChild{c: 2},
            s2: AlsoChild{d: 3},
        };
    }
}