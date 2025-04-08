// Large, deeply nested optional chains mixed with concrete fields
struct Leaf {
    num: Int as uint16;
}

struct Branch {
    leafOpt: Leaf?;
    other: Int;
}

struct Trunk {
    branchOpt: Branch?;
    flag: Bool;
}

contract NestedOptionalChain {
    root: Trunk;

    init() {
        self.root = Trunk{
            branchOpt: null,
            flag: true
        };
    }
}
