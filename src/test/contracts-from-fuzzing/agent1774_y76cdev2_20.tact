struct DeepOpt {
    x: Int?;
}

struct MidOpt {
    deep: DeepOpt?;
}

struct TopOpt {
    mid: MidOpt?;
}

contract TestContract {
    opt: TopOpt;

    init() {
        self.opt = TopOpt{
            mid: MidOpt{
                deep: DeepOpt{x:null}
            }
        };
    }
}
