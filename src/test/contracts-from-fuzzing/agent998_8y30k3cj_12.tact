struct MidLevelOpt {
    i: Int?;
    s: String?;
}

struct TwoLevelOpt {
    middle: MidLevelOpt?;
    b: Bool;
}

contract OptionalNestedInner {
    dat: TwoLevelOpt;

    init() {
        self.dat = TwoLevelOpt{
            middle: MidLevelOpt{i: null, s:null},
            b: true
        };
    }
}