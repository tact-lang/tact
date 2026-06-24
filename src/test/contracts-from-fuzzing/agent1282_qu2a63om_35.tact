// Use multiple nested structs with default values and some optionals
struct Leaf {
    label: String = "leaf";
    note: String?;
}

struct Branch {
    left: Leaf = Leaf{};
    right: Leaf = Leaf{};
}

struct Tree {
    b: Branch?;
    name: String = "oak";
}

contract DefaultOptionalMix {
    foo: Tree;

    init() {
        self.foo = Tree{
            b: null,
            name: "pine"
        };
    }
}
