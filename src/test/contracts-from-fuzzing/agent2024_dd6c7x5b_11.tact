struct Child {
    val: Int;
}

struct Parent {
    child: Child;
}

contract OptionalNestedStruct {
    parent: Parent?;

    init() {
        self.parent = null;
    }
}