struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract OptNestedStruct {
    root: Root;

    init() {
        self.root = Root{
            mid: Mid{
                leaf: Leaf{ val: 100 }
            }
        };
    }
}