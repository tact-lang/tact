struct Leaf {
    val: Int? = null;
}

struct Middle {
    leaf: Leaf = Leaf{};
    name: String = "middle";
}

struct Root {
    m: Middle = Middle{};
    status: Bool = false;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{};
    }
}