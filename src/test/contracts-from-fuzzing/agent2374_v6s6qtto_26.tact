struct SmallOpt {
    a: Int?;
    b: Bool?;
}

struct MiddleOpt {
    s: SmallOpt?;
    b: Bool;
}

struct TopOpt {
    m: MiddleOpt?;
    s: SmallOpt;
}

contract OptChain {
    state: TopOpt;

    init() {
        self.state = TopOpt{
            m: null,
            s: SmallOpt{a:null,b:true}
        };
    }
}