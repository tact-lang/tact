struct OptionalNest {
    innerVal: Int?;
    innerStr: String?;
    deeper: Deeper?;
}

struct Deeper {
    flag: Bool?;
    value: Int?;
}

contract OptionalTester {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            innerVal: null,
            innerStr: null,
            deeper: null
        };
    }
}