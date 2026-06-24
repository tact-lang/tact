struct Leaf {
    value: Int;
}

contract TestContract {
    optLeaf: Leaf?;

    init() {
        self.optLeaf = Leaf{ value: 42 };
    }
}