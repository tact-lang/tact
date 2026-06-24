struct DeepInner {
    b: Int?;
}

struct Middle {
    a: DeepInner;
}

struct OuterOpt {
    middle: Middle?;
}

contract OptionChains {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            middle: null,
        };
    }
}