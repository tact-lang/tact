struct OptDeep {
    inner: Int?;
}

struct MidOpt {
    opt: OptDeep?;
}

struct TopOpt {
    top: MidOpt?;
}

contract DeepOptChain {
    data: TopOpt;
    init() {
        self.data = TopOpt{
            top: null
        };
    }
}