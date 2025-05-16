struct OptionalNest {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    text: String?;
    num: Int?;
}

contract TestOptionalNest {
    state: OptionalNest;
    init() {
        self.state = OptionalNest{
            innerOpt: InnerOpt{
                flag: true,
                text: null,
                num: 999,
            }
        };
    }
}
