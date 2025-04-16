struct LeafDefault {
    flag: Bool = true;
    num: Int = 42;
}

struct BranchDef {
    leaf: LeafDefault;
    innerOpt: LeafDefault?;
}

contract DefaultsNested {
    st: BranchDef;

    init() {
        self.st = BranchDef{
            leaf: LeafDefault{},
            innerOpt: null,
        };
    }
}