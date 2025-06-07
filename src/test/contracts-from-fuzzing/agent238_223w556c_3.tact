struct DeepNested {
    nested: Nested2;
}

struct Nested2 {
    inner: Nested3;
}

struct Nested3 {
    leaf1: Int;
    leaf2: Bool;
}

contract DeepTree {
    root: DeepNested;

    init() {
        self.root = DeepNested {
            nested: Nested2 {
                inner: Nested3 {
                    leaf1: 11,
                    leaf2: false,
                }
            }
        };
    }
}