struct DeepBranch {
    x: Int;
    y: Middle;
}

struct Middle {
    z: Int;
    q: Leaf;
}

struct Leaf {
    v: Bool;
    t: String?;
}

contract NestedBranchTest {
    d: DeepBranch;

    init() {
        self.d = DeepBranch{
            x:10, y: Middle{ z: 20, q: Leaf { v: true, t: null } },
        };
    }
}
