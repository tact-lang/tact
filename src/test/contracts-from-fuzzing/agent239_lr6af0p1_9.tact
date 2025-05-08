struct InnerMost {
    z: Int;
}

struct MidOpt {
    mid: InnerMost?;
}

struct TopOpt {
    top: MidOpt?;
}

contract OptionNest {
    val: TopOpt;

    init() {
        self.val = TopOpt{ top: null };
    }
}