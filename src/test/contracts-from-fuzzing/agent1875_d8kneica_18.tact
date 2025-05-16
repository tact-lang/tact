struct DefaultLeaf {
    x: Int = 11;
    y: Int = 22;
}

struct Middle {
    leaf: DefaultLeaf = DefaultLeaf{};
}

contract FuzzPartialNestedDefaults {
    store: Middle;

    init() {
        self.store = Middle{};
    }
}
