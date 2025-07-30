struct Leaf {
    x: Int;
}

struct Middle {
    l: Leaf;
}

struct Root {
    m: Middle;
}

contract Test {
    data: Root;

    init() {
        self.data = Root{ m: Middle{ l: Leaf{ x: 123 } } };
    }
}