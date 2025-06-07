struct InnerS {
    flag: Bool?;
    num: Int?;
}

struct OuterS {
    innerOpt: InnerS?;
    strOpt: String?;
}

contract OptionalNestedStructs {
    data: OuterS?;

    init() {
        self.data = null;
    }
}