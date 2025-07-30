struct DeepBranch {
    x: Int;
    y: InnerLeaf;
}

struct InnerLeaf {
    flag: Bool;
    optional: String?;
}

contract BranchTest {
    rec: DeepBranch;

    init() {
        self.rec = DeepBranch{
            x: 23,
            y: InnerLeaf{
                flag: false,
                optional: null,
            },
        };
    }
}