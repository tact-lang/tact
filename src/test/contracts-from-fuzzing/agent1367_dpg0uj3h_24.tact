struct LeafOpt {
    x: Int?;
}

struct MidOpt {
    left: LeafOpt;
    right: LeafOpt;
}

struct RootOpt {
    l: MidOpt;
    r: MidOpt;
}

contract NestedBranching {
    tree: RootOpt;

    init() {
        self.tree = RootOpt{
            l: MidOpt{
                left: LeafOpt{x: null},
                right: LeafOpt{x: null},
            },
            r: MidOpt{
                left: LeafOpt{x: null},
                right: LeafOpt{x: null},
            },
        };
    }
}