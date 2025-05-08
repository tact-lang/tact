struct Child {
    val: Int = 42;
}

struct Parent {
    child: Child = Child{};
}

contract NestedDefaults {
    data: Parent;

    init() {
        self.data = Parent{};
    }
}
