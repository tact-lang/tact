struct SChild {
    x: Int;
    y: Int;
}

struct SParent {
    child1: SChild;
    child2: SChild;
    child3: SChild;
}

contract MultiNested {
    nested: SParent;

    init() {
        self.nested = SParent{
            child1: SChild{ x:1, y:2 },
            child2: SChild{ x:3, y:4 },
            child3: SChild{ x:5, y:6 }
        };
    }
}