struct Leaf {
    x: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract OptionalNestedStruct {
    b: Branch;

    init() {
        self.b = Branch {
            leaf: null
        };
    }
}