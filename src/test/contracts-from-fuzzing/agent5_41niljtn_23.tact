struct Leaf {
    x: Int;
}

contract OptionalChain {
    left: Leaf?;
    right: Leaf?;

    init() {
        self.left = null;
        self.right = Leaf{x: 100};
    }
}