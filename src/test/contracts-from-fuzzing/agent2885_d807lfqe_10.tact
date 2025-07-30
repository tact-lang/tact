struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    c: Int;
    d: Child;
    e: Bool;
}

contract OptStructMid {
    maybeParent: Parent?;

    init() {
        self.maybeParent = null;
    }
}