struct InnerMostOpt {
    a: Int?;
    b: Bool?;
}

struct Level2Opt {
    inner1: InnerMostOpt;
    inner2: InnerMostOpt;
}

contract OptInStructs {
    l2opt: Level2Opt;

    init() {
        self.l2opt = Level2Opt{
            inner1: InnerMostOpt{a:null,b:null},
            inner2: InnerMostOpt{a:null,b:null}
        };
    }
}