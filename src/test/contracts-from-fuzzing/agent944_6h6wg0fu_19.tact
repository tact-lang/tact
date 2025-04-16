struct Child {
    foo: Int?;
    bar: Bool?;
}

struct Parent {
    child: Child? = null;
    number: Int = 7;
}

contract WithNestedOptDefaults {
    data: Parent = Parent{};

    init() {
        self.data = Parent{};
    }
}