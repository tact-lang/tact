struct Child {
    a: Int = 5;
    b: Bool = false;
}

struct Parent {
    ca: Child = Child{};
    flag: Bool = true;
}

contract TestDefaults {
    s: Parent;
    init() {
        self.s = Parent{};
    }
}