// Deep struct tree with optionals to test layout encoding
struct Leaf {
    v: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    main: Branch?;
}

contract TreeTest {
    storage: Root;

    init() {
        self.storage = Root{ main: null };
    }
}