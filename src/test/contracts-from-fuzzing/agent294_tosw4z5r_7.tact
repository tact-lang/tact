struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract OptionalNested {
    data: Branch;

    init() {
        self.data = Branch{ leaf: null };
    }
}
