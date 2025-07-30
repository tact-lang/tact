struct ChainMixedOpt {
    a: Int?;
    b: NestedOpt?;
}

struct NestedOpt {
    c: Int?;
}

contract ChainMixedOptional {
    data: ChainMixedOpt;

    init() {
        self.data = ChainMixedOpt{
            a: null,
            b: NestedOpt{ c: null }
        };
    }
}