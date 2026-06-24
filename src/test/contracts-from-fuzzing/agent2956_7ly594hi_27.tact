struct OptionalBoolNest {
    x: Bool?;
    inner: InnerOpt?;
}

struct InnerOpt {
    y: Bool?;
    deep: Bool?;
}

contract OptionBoolChain {
    val: OptionalBoolNest;

    init() {
        self.val = OptionalBoolNest{
            x: null,
            inner: null,
        };
    }
}
