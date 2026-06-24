struct Leaf {
    a: Int?;
    b: Int;
}

struct Mid {
    leaf: Leaf? = null;
}

struct Root {
    mid: Mid?;
}

contract TestContract {
    data: Root = Root{ mid: null };

    init() {
        self.data = Root{ mid: Mid{} };
    }
}
