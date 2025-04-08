struct Parent {
    child: Child;
}

struct Child {
    grandChild: GrandChild;
}

struct GrandChild {
    val: Int;
}

contract InlineStructs {
    stored: Parent;

    init() {
        self.stored = Parent{ child: Child{ grandChild: GrandChild{ val: 7 } } };
    }
}