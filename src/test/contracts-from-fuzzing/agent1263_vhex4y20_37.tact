struct Leaf {
    foo: Int = CONST_INT;
}

const CONST_INT: Int = 42;

contract Test {
    val: Leaf;

    init() {
        self.val = Leaf {};
    }
}