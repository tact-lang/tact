struct Leaf {
    val: Int;
}

struct Mid {
    node: Leaf?;
    flag: Bool;
}

contract OptionalNestedStruct {
    root: Mid;

    init() {
        self.root = Mid{
            node: null,
            flag: true
        };
    }
}