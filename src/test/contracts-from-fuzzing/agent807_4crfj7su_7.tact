struct Child {
    foo: Int;
    opt: Bool?;
}

struct Parent {
    childA: Child;
    childB: Child;
}

contract SiblingNesting {
    val: Parent;
    init() {
        self.val = Parent{
            childA: Child{ foo: 1, opt: null },
            childB: Child{ foo: 2, opt: true },
        };
    }
}