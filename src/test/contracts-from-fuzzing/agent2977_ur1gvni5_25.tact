struct Wrap {
    i: Int;
}

struct Contain {
    w: Wrap;
}

contract NestedStructs {
    val: Contain;

    init() {
        self.val = Contain{ w: Wrap{ i: 5 } };
    }
}