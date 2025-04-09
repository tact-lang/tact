struct OptionInNested {
    data: InnerOpt;
}

struct InnerOpt {
    maybeValue: Int?;
}

contract OptionInDeepNested {
    f: OptionInNested;

    init() {
        self.f = OptionInNested{
            data: InnerOpt{
                maybeValue: null
            }
        };
    }
}