struct LeafOpt {
    val: Int?;
    flag: Bool;
}

struct MidOpt {
    innerOpt: LeafOpt?;
    info: String;
}

struct TopOpt {
    midOpt: MidOpt?;
}

contract ChainOptionalNesting {
    state: TopOpt;

    init() {
        self.state = TopOpt{
            midOpt: null
        };
    }
}
