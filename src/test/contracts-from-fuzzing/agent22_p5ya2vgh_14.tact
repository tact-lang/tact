struct Leaf {
    val: Int = 100;
    label: String = "leaf";
}

struct Middle {
    info: Leaf = Leaf{};
    extra: String? = null;
}

struct Root {
    inner: Middle = Middle{};
    flag: Bool = false;
}

contract NestedDefaults {
    s: Root;

    init() {
        self.s = Root{};
    }
}
