struct Child {
    a: Int;
    b: Int;
}

struct Parent {
    child: Child;
    c: Int;
}

contract TestContract {
    receive() {
        let p: Parent = Parent { child: Child { a: 10, b: 20 }, c: 30 };
        dump(p.child.a);
    }
}
