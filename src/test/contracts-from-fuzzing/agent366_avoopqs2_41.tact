struct Leaf {
    x: Int;
    y: Bool;
}

struct Middle {
    leaf: Leaf? = null;
    comment: String? = null;
}

struct Root {
    middle: Middle? = null;
}

contract ComplicatedOptionals {
    state: Root;
    init() {
        self.state = Root{};
    }
}