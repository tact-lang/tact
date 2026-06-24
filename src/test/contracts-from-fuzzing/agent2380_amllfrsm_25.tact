struct Leaf {
    val: Int;
}

struct Branch {
    sub: Leaf? = null;
    extra: Int;
}

contract TestContract {
    tree: Branch;
    init() {
        self.tree = Branch{
            extra: 99
        };
    }
}