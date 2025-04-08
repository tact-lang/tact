struct InnerMost {
    a: Int?;
}

struct MidLevel {
    innerOpt: InnerMost?;
}

struct TopLevel {
    midOpt: MidLevel?;
}

contract OptionalStructChain {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            midOpt: null
        };
    }
}