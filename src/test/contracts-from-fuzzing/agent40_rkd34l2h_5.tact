struct Child {
    value: Int;
}

struct Parent {
    child: Child;
    tag: Int;
}

contract Test {
    receive() {
        let p = Parent{ child: Child{ value: 123 }, tag: 42 };
    }
}
