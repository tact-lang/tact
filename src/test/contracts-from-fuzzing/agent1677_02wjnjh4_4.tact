struct OptionalDeep {
    level1: InnerOpt?;
}

struct InnerOpt {
    level2: Int?;
    level3: Bool?;
}

contract TestOptDeep {
    val: OptionalDeep = OptionalDeep{ level1: null };

    init() {
        self.val = OptionalDeep{
            level1: InnerOpt{
                level2: 5,
                level3: false
            }
        };
    }
}