struct ChildA {
    x: Int;
}
struct ChildB {
    y: Bool;
}

struct Parent {
    a: ChildA;
    b: ChildB;
    z: Int;
}

contract OptNested {
    maybeParent: Parent?;

    init() {
        self.maybeParent = null;
    }
}