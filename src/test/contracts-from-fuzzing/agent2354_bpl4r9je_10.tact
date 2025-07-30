struct Child {
    b: Bool;
}

struct Parent {
    x: Int;
    child: Child;
}

contract ChangeNestedInit {
    data: Parent;

    init() {
        self.data = Parent{ x: 3, child: Child{ b: false } };
        self.data = Parent{ x: 4, child: Child{ b: true } };
    }
}