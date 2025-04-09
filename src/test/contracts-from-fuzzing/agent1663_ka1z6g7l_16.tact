struct Final {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct MidOpt {
    mid: Final?;
}

struct TopMost {
    top: MidOpt;
}

contract OptInMiddle {
    data: TopMost;

    init() {
        self.data = TopMost{
            top: MidOpt{
                mid: null
            }
        };
    }
}