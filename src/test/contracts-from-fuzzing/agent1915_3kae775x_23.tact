struct One {
    a: Int?;
}

struct Two {
    b: One?;
}

struct Three {
    c: Two?;
}

contract NestedOptionChain {
    val: Three;

    init() {
        self.val = Three{ c: null };
    }
}