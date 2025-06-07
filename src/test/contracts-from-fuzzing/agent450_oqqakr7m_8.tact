struct Leaf {
    z: Int;
}

struct Mid {
    y: Leaf?;
}

struct Root {
    x: Mid;
}

contract NestedOptionalStruct {
    data: Root;
    init() {
        self.data = Root{x: Mid{y: Leaf{z: 9}}};
    }
}