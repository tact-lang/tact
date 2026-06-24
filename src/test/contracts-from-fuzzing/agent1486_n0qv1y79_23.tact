struct LeafDefault {
    x: Int = 17;
    y: Bool = false;
}

struct BranchDefault {
    leaf: LeafDefault = LeafDefault{};
    label: String = "branchy";
}

struct TreeDefault {
    id: Int = 1;
    branch: BranchDefault = BranchDefault{};
}

contract DeepDefaults {
    data: TreeDefault;

    init() {
        self.data = TreeDefault{};  // Should trigger a fully default init
    }
}