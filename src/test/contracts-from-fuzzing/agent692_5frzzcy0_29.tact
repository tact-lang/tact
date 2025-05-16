struct TopOpt {
    mid: MidOpt?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int;
}

contract OptionalChain {
    value: TopOpt;

    init() {
        self.value = TopOpt{
            mid: null
        };
    }
}