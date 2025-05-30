struct Child {
    x: Int;
    y: Bool;
}

struct Parent {
    first: Int;
    nested: Child;
    second: Bool;
}

contract NestedOrderContract {
    info: Parent;

    init() {
        self.info = Parent{ first: 1, nested: Child{ x: 10, y: true }, second: false };
    }
}