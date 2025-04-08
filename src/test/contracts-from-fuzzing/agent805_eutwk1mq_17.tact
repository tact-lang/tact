struct Leaf {
    val: Int? = null;
}

struct Mid {
    leaf: Leaf? = null;
}

struct Root {
    mid: Mid? = null;
    label: String = "root";
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{};
    }
}