struct BranchOpt {
    sub: SubOpt?;
}

struct SubOpt {
    x: Int;
}

contract OptChain {
    val: BranchOpt;

    init() {
        self.val = BranchOpt{
            sub: null
        };
    }
}