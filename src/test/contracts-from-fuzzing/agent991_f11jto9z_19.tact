struct Leaf {
    x: Int?;
    y: Bool;
}

struct Branch {
    leaf: Leaf?;
    msg: String;
}

contract ComboPersist {
    branch: Branch?;
    mainVal: Int?;
    flagVal: Bool?;

    init() {}
}