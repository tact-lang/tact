struct DeepOption {
    opt: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

contract DoubleOffsets {
    s: DeepOption;

    init() {
        self.s = DeepOption{
            opt: InnerOpt{val: null, flag: null}
        };
    }
}