struct DeepOptionals {
    innerOpt: Int?;
    innerBoolOpt: Bool?;
}

struct Wrap2 {
    deep: DeepOptionals;
    txt: String?;
}

contract OptionChain {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            deep: DeepOptionals{
                innerOpt: null,
                innerBoolOpt: null,
            },
            txt: null,
        };
    }
}