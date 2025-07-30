struct Leaf {
    leafVal: Int?;
    leafStr: String?;
}

struct Branch {
    branchVal: Bool;
    leaf: Leaf;
}

struct Root {
    rootVal: Address?;
    inner: Branch;
}

contract TestContract {
    nestedOpt: Root;
    init() {
        self.nestedOpt = Root{
            rootVal: null,
            inner: Branch{
                branchVal: false,
                leaf: Leaf{
                    leafVal: 42,
                    leafStr: null
                }
            }
        };
    }
}