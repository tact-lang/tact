struct Child { x: Int; }

struct Parent { c: Child; }

struct GrandParent { p: Parent; }

contract NestedThree {
    data: GrandParent;

    init() {
        self.data = GrandParent{ p: Parent{ c: Child{ x:5 } } };
    }
}
