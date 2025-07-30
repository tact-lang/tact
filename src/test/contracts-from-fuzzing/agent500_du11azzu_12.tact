struct Child {
    y: Int;
}

struct Parent {
    child: Child;
}

struct GrandParent {
    parent: Parent;
}

contract NestedChain {
    data: GrandParent;
    init() {
        self.data = GrandParent{ parent: Parent{ child: Child{ y: 42 } } };
    }
    receive() {}
}