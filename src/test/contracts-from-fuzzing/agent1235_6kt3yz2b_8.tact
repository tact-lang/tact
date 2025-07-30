struct OptionalBranch {
    left: Int?;
    right: Int?;
}

struct NestedOptionalBranches {
    branch: OptionalBranch?;
    status: Bool;
}

contract OptionTree {
    tree: NestedOptionalBranches;

    init() {
        self.tree = NestedOptionalBranches{
            branch: OptionalBranch{
                left: null,
                right: 2,
            },
            status: true,
        };
    }
}
