struct Leaf {
    lval: Int = 7;
}

struct Middle {
    mval: Int = 5;
    leaf: Leaf;
}

struct Root {
    rflag: Bool = true;
    middle: Middle;
}

contract TestContract {
    data: Root;
    init() {
        self.data = Root{ middle: Middle{ leaf: Leaf{} } };
    }
}