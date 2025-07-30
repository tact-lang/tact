struct Child {
    val: Int;
}

struct Parent {
    child: Child;
}

struct GrandParent {
    parent: Parent;
}

contract DeepOptionalInHierarchy {
    root: GrandParent?;

    init() {
        self.root = null;
    }
}