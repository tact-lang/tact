struct Leaf {
    text: String = "default";
    num: Int;
}

struct Branch {
    leaf: Leaf;
    active: Bool;
}

contract TestContract {
    data: Branch;
    init() {
        self.data = Branch{
            leaf: Leaf{ num: 42 },
            active: true
        };
    }
}