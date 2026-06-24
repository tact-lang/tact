struct DefaultLeaf {
    x: Int = 11;
    y: Int = 22;
}

struct Middle {
    leaf: DefaultLeaf = DefaultLeaf{};
}

contract FuzzOverrideDefaults {
    store: Middle;

    init() {
        self.store = Middle {
            leaf: DefaultLeaf {
                x: 88 // override only x
                // omit y -> should use default 22
            }
        };
    }
}
