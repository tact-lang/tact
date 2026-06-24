struct OptChain {
    first: Int?;
    second: Next?;
}

struct Next {
    third: Int?;
    fourth: Bool?;
}

contract OnChainOpt {
    val: OptChain;

    init() {
        self.val = OptChain{
            first: null,
            second: Next{
                third: 42,
                fourth: null,
            }
        };
    }
}
