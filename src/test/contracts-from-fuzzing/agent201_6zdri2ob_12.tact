struct DeepOpt {
    d: Int?;
}
struct MidOpt {
    m: DeepOpt?;
}
struct TopOpt {
    t: MidOpt?;
}

contract OptionOnOptionStructs {
    val: TopOpt;

    init() {
        self.val = TopOpt{ t: null };
    }
}
