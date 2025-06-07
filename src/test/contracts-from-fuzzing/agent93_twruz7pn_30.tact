struct LeafData {
    id: Int;
    note: String?;
}

struct BranchData {
    left: LeafData?;
    right: LeafData?;
}

contract NullAtTop {
    branch: BranchData?;

    init() {
        self.branch = null;
    }
}