struct Leaf {
    content: String;
}

struct MiddleOpt {
    leaf: Leaf?;
}

struct Root {
    mid: MiddleOpt;
}

contract NestedOptionalStructs {
    root: Root;

    init() {
        self.root = Root{
            mid: MiddleOpt{
                leaf: null
            }
        };
    }
}