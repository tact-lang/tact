struct OptionalChainsDeeper {
    a: Int?;
    b: NestedA?;
}

struct NestedA {
    b1: Int?;
    b2: Int?;
    b3: Int?;
}

contract OptionalChainContract {
    deep: OptionalChainsDeeper;

    init() {
        self.deep = OptionalChainsDeeper{
            a:null,
            b:null
        };
    }
}