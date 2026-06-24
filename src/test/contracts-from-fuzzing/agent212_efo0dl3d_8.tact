struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract TestContract {
    br: Branch?;

    init() {
        self.br = Branch{ leaf: null };
    }
}