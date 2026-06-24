struct Leaf {
    value: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
    label: String;
}

contract OptionalBranchTree(
    root: Branch?,
    enabled: Bool,
) {
}