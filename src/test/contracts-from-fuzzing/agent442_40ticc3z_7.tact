struct Sibling {
    val: Int;
}

struct Parent {
    first: Sibling;
    second: Sibling;
}

contract TestContract {
    parent: Parent;

    init() {
        self.parent = Parent{
            first: Sibling{val:1},
            second: Sibling{val:2}
        };
    }
}
