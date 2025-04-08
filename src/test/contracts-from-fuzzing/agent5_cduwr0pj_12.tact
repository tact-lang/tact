struct Leaf {
    x: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract NestOpt {
    root: Root = Root{ branch: null };
}
