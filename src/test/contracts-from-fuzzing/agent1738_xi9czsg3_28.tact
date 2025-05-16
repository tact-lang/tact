struct Sopt {
    optInt: Int?;
}

struct SoptOpt {
    opt: Sopt?;
}

contract Test {
    soptopt: SoptOpt;

    init() {
        self.soptopt = SoptOpt{
            opt: null
        };
    }
}