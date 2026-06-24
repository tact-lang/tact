struct Child {
    i: Int;
    b: Bool;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract DeepOptions {
    d: Parent?;

    init() {
        self.d = null;
    }
}