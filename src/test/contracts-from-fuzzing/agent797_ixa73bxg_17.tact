struct Leaf {
    a: Int = 9;
    b: Bool = true;
}

struct Mid {
    leaf: Leaf = Leaf{};
    str: String = "hi";
}

struct Root {
    mid: Mid;
    num: Int = 1;
}

contract TestPartialNestedDefaults {
    data: Root = Root{
        mid: Mid{ },  // rely on Mid defaults => Leaf defaults
        num: 2
    };
    init() {}
}