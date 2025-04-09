struct LargeOptChain {
    a: Int?;
    b: LargeOptChainB?;
}

struct LargeOptChainB {
    c: LargeOptChainC?;
}

struct LargeOptChainC {
    d: LargeOptChainD?;
}

struct LargeOptChainD {
    e: Int?;
}

contract LargeNested {
    data: LargeOptChain;
    init() {
        self.data = LargeOptChain{
            a: null,
            b: LargeOptChainB{
                c: null
            }
        };
    }
}
