struct Leaf {
    value: Int;
}

contract TestContract {
    optLeaf: Leaf?;

    init() {
        self.optLeaf = null;
    }
}