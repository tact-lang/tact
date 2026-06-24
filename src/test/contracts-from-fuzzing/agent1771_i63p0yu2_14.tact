struct Inner {
    x: Int = 5;
}

struct Mid {
    innerOpt: Inner?;
    innerDef: Inner;
}

contract MixedOptionalDefaultNested {
    data: Mid;

    init() {
        self.data = Mid{
            innerOpt: null,
            innerDef: Inner{},
        };
    }
}