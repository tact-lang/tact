struct Child {
    val: Int;
}

struct Parent {
    child: Child?;
}

contract OptInner {
    parent: Parent;

    init() {
        self.parent = Parent{ child: null };
    }
}
