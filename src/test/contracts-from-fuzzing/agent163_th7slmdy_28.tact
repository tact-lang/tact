struct ChildA {
    val: Int;
}

struct ChildB {
    sub: ChildA;
}

struct Root {
    ca: ChildA;
    cb: ChildB;
}

contract DoubleNested {
    root: Root;
    init() {
        self.root = Root{
            ca: ChildA{ val:1 },
            cb: ChildB{ sub: ChildA{ val: 2 } }
        };
    }
}