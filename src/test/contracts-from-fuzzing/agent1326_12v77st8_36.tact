struct Leaf {
    value: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

contract MultiBranch {
    b1: Branch;
    b2: Branch;
    init() {
        self.b1 = Branch{left: Leaf{value:1}, right: Leaf{value:2}};
        self.b2 = Branch{left: Leaf{value:3}, right: Leaf{value:4}};
    }
}