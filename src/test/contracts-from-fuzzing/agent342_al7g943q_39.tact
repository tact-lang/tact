struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalTree {
    top: Branch;

    init() {
        self.top = Branch{ left: null, right: null };
    }
}
