struct Leaf {
    a: Int = 42;
}

struct Mid {
    leaf: Leaf? = null;
}

contract TestContract {
    val: Mid;

    init() {
        self.val = Mid{};
    }
}