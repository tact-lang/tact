struct Leaf {
    num: Int;
}

struct Branch {
    inner: Leaf;
}

contract DefaultsNested {
    b: Branch = Branch{ inner: Leaf{ num: 5 } };
    c: Branch;

    init() {
        self.c = Branch{ inner: Leaf{ num: 42 } };
    }
}