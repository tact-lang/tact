struct BranchA { x: Int; }
struct BranchB { y: String; }

struct RootUnion {
    left: BranchA?;
    right: BranchB?;
}

contract OptionalBranches {
    tree: RootUnion;

    init() {
        self.tree = RootUnion{
            left: null,
            right: null,
        };
    }
}