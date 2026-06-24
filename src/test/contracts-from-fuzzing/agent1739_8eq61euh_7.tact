struct DeepOptions {
    optInt: Int?;
    optBool: Bool?;
    optInner: Inner?;
}

struct Inner {
    innerVal: Int?;
}

contract Test {
    nestedOpt: DeepOptions;

    init() {
        self.nestedOpt = DeepOptions{
            optInt: null,
            optBool: null,
            optInner: null
        };
    }
}
