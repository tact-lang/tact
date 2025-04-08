// Variant: nested structs with primitive defaults and nested optionals
struct Leaf {
    value: Int = 999;
}

struct Branch {
    child: Leaf?;
    active: Bool = true;
}

struct Tree {
    left: Branch?;
    right: Branch?;
    label: String = "oak";
}

contract DefaultsNested {
    t: Tree;

    init() {
        self.t = Tree{
            left: null,
            right: null
        };
    }
}