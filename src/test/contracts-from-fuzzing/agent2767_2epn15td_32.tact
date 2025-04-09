struct Leaf {
    opt: Int? = null;
}

struct Mid {
    leaf: Leaf;
}

contract PartDefaults {
    val: Mid;

    init() {
        self.val = Mid{ leaf: Leaf{} };
    }
}