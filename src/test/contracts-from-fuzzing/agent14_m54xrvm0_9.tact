struct Child {
    x: Int;
}

struct Parent {
    a: Child?;
    b: Child?;
    c: Child?;
}

contract Test9 {
    record: Parent;

    init() {
        self.record = Parent{ a: null, b: null, c: null };
    }
}
