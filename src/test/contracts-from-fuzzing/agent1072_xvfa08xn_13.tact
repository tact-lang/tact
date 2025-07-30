struct Child {
    x: Int;
}

struct Parent {
    a: Bool;
    c: Child;
}

contract NestedOpt {
    val: Parent?;
    init() {
        self.val = null;
    }
}