struct Leaf {
    x: Int;
}

struct Branch {
    child: Leaf? = null;
}

contract DefaultNullNestedOpt {
    data: Branch;

    init() {
        self.data = Branch{ child: null };
    }
}