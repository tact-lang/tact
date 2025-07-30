struct Leaf {
    x: Int?;
}

struct Branch {
    leaf: Leaf;
}

contract TestContract {
    a: Branch;
    b: Branch?;

    init() {
        self.a = Branch{ leaf: Leaf{ x: 100 } };
        self.b = null;
    }

    receive() {
        let _ = self.a.leaf.x;
    }
}