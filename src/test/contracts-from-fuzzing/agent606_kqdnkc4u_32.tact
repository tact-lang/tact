struct Child {
    foo: Int = 5;
}

struct Parent {
    child: Child?;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent{ child: null };
    }
}