struct Leaf { value: Int; }

struct MaybeLeaf {
    val: Leaf?;
}

struct Container {
    leaf1: MaybeLeaf;
    leaf2: MaybeLeaf;
}

contract NestedOptionalStructs {
    data: Container;

    init() {
        self.data = Container{
            leaf1: MaybeLeaf{ val: null },
            leaf2: MaybeLeaf{ val: null },
        };
    }
}