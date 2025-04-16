struct Mid {
    m1: Int;
    m2: Leaf;
}

struct Leaf {
    l1: Int;
    l2: Int;
}

contract TestContract {
    val: Mid;

    init() {
        self.val = Mid{ m1: 1, m2: Leaf{ l1: 2, l2: 3 } };
    }
}