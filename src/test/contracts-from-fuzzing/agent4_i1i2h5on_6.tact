struct OptionNest {
    val1: Int?;
    val2: Bool?;
    sub: SubOpt?;
}

struct SubOpt {
    x: Int?;
}

contract TestContract {
    nestedOpt: OptionNest;

    init() {
        self.nestedOpt = OptionNest {
            val1: 42,
            val2: null,
            sub: SubOpt {
                x: null
            }
        };
    }
}
