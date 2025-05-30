struct Child {
    info: String = "child";
    optNum: Int?; // default null
}

struct Parent {
    name: String = "parent";
    maybeChild: Child?;  // optional nested struct, defaults null
}

contract OptionalNestedContract {
    p: Parent = Parent{};

    init() {
        self.p = Parent{
            name: "updated",
            maybeChild: Child{ info: "filled", optNum: 77 }
        };
    }
}