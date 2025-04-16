struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf;
}

struct Root {
    branch: Branch;
}

contract TestContract {
    rootOpt: Root? = null;
}