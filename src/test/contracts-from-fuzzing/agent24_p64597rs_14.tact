message Parent {
    child: Child;
}

contract Test {
    receive(msg: Parent) {
        let v = msg.child.value;
    }
}

struct Child {
    value: Int;
}