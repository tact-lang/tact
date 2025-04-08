struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf? = null;
}

contract Test {
    data: Branch;

    init() {
        self.data = Branch{};
    }
}