struct OptionDeep {
    innerVal: Int?;
    nestedOpt: Bool?;
}

struct ContainsOpt {
    first: OptionDeep;
    lastFlag: Bool;
}

contract Test {
    optField: ContainsOpt;

    init() {
        self.optField = ContainsOpt{
            first: OptionDeep{innerVal: 123, nestedOpt: null},
            lastFlag: false
        };
    }
}