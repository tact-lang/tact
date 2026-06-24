struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
    tag: String;
}

contract NestedOptStruct {
    b: Branch;

    init() {
        self.b = Branch{
            leaf: Leaf{val: 77},
            tag: "branch"
        };
    }
}