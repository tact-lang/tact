struct OptionalLeaf {
    leaf: Int?;
}

contract OptionalLeafExample {
    opt: OptionalLeaf;

    init() {
        self.opt = OptionalLeaf{ leaf: null };
    }
}
