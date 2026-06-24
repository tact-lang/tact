struct Leaf {
    a: Int = 1;
    b: Bool = true;
}

struct Branch {
    l: Leaf;
    name: String = "branch";
}

struct Root {
    main: Branch;
    alt: Branch;
    count: Int = 42;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            main: Branch{ l: Leaf{} },
            alt: Branch{ l: Leaf{} }
        };
    }
}