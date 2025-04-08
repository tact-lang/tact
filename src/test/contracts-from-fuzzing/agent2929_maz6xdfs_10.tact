struct Leaf {
    value: Int = 0;
    name: String = "leaf";
    flag: Bool?;
}

struct Branch {
    leaf: Leaf?;
    label: String = "branch";
}

struct Tree {
    branch: Branch;
    age: Int;
}

contract Forest(
    metadata: Tree,
    alive: Bool
) { }