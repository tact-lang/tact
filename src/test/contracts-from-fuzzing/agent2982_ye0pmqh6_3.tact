struct Deep3 {
    d: Int = 3;
}

struct Deep2 {
    c: Deep3 = Deep3{};
}

struct Deep1 {
    b: Deep2 = Deep2{};
}

struct Root {
    a: Deep1 = Deep1{};
}

contract DeepNestedTest {
    tree: Root = Root{};

    init() {
        self.tree = Root{};
    }
}