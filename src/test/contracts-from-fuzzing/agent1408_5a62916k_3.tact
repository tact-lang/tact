struct DeepOptional {
    nestedOpt: InnerNested?;
}

struct InnerNested {
    innerOpt: InnerMost?;
}

struct InnerMost {
    num: Int;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nestedOpt: InnerNested{
                innerOpt: InnerMost{
                    num: 99,
                },
            },
        };
    }
}