struct LeafOpt {
    leafVal: Bool?; // will be null by default
}

struct BranchOpt {
    left: LeafOpt?;
    right: LeafOpt;
}

contract DefaultsCascade {
    data: BranchOpt;

    init() {
        self.data = BranchOpt{
            left: null,
            right: LeafOpt{
                leafVal: null
            }
        };
    }
}