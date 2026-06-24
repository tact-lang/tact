struct Child {
    x: Int;
}

struct Parent {
    child: Child;
}

contract DeepNested {
    val: Parent;

    init() {
        self.val = Parent{ child: Child{ x: 1 } };
    }
}