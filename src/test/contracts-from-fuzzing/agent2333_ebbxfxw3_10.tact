struct LargeOptionalTree {
    branch: OptionalBranch?;
}

struct OptionalBranch {
    leaf1: Int?;
    leaf2: Int?;
    leaf3: Int?;
}

contract TestLargeOptionalTree {
    data: LargeOptionalTree;

    init() {
        self.data = LargeOptionalTree{
            branch: OptionalBranch{
                leaf1: 1,
                leaf2: null,
                leaf3: 3
            }
        };
    }
}