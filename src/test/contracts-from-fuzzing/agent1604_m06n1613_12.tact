struct Child {
    val: Int;
}

struct Parent {
    child: Child;
}

struct GrandParent {
    parent: Parent;
}

contract DeepPersist {
    store: GrandParent = GrandParent { parent: Parent { child: Child { val: 12345 } } };

    receive() {}
}