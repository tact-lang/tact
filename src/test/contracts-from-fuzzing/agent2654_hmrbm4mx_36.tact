struct DeepOpt {
    a: Int?;
}

struct MidOpt {
    d: DeepOpt?;
}

contract OptInsideOpt {
    m: MidOpt;

    init() {
        self.m = MidOpt{
            d:null
        };
    }
}