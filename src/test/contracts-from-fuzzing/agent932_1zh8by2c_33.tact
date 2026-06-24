// Check a contract with only a deeply nested optional struct inside an optional contract field
struct LeafOpt {
    x: Int?;
    y: Bool?;
}

struct BranchOpt {
    leaf: LeafOpt?;
}

contract OptionalDeep {
    branch: BranchOpt?;

    init() {
        self.branch = null;
    }
}
