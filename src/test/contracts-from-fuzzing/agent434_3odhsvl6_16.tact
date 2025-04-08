struct Leaf {
    v: Int;
}

struct Mid {
    optLeaf: Leaf?;
    reqLeaf: Leaf;
}

struct Root {
    mid: Mid;
}

contract MixedNestedOpt {
    state: Root;

    init() {
        self.state = Root{
            mid: Mid{
                optLeaf: null,
                reqLeaf: Leaf{ v: 123 }
            }
        };
    }

    receive() {}
}
