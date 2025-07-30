struct Leaf {
    d: String? = null;
    f: Int? = 0;
    e: Bool? = null;
    c: Int? = 1;
}

struct Branch {
    left: Leaf? = null;
    right: Leaf? = Leaf{ d: "default", f: 42, e: true, c: -1 };
    name: String? = null;
}

struct BigTree {
    main: Branch? = null;
    alt: Branch = Branch{};
    flag: Bool = true;
}

contract NestedOptionWide {
    tree: BigTree = BigTree{ main: null, alt: Branch{}, flag: true };

    init() {}
}