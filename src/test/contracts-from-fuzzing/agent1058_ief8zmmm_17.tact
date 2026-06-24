struct Sibling {
    foo: Int;
}

struct Parent {
    x: Sibling;
    y: Sibling;
}

contract SiblingTest {
    data: Parent;

    init() {
        self.data = Parent{ x: Sibling{ foo:1 }, y: Sibling{ foo:2 } };
    }
}