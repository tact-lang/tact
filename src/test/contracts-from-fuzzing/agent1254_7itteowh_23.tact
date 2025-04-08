struct OptionInMiddle {
    x: Int;
}

struct WithOpt {
    y: OptionInMiddle?;
}

contract MidNestedOpt {
    d: WithOpt;
    init() {
        self.d = WithOpt{
            y: null,
        };
    }
}