struct Leaf {
    id: Int? as uint32;
}

struct Mid {
    node: Leaf?;
}

struct Root {
    branch: Mid?;
}

contract Test {
    data: Root;

    init() {
        self.data = Root{
            branch: null
        };
    }
}
