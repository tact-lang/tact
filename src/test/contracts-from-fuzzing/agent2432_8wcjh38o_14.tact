struct SDeep {
    grandchild: SChild;
}

struct SChild {
    child: S;
}

struct S {
    val: Int;
}

contract Test {
    root: SDeep;
    init() {
        self.root = SDeep{ grandchild: SChild{ child: S{ val: 123 } } };
    }
}