struct Leaf {
    x: Int;
    rem: Cell as remaining;
}

struct Mid {
    leaf: Leaf;
}

contract NestedRemaining {
    m: Mid;

    init() {
        self.m = Mid{ leaf: Leaf{ x:1, rem: emptyCell() } };
    }
}