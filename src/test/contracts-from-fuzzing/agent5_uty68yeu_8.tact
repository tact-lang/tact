struct InnerOpt {
    value: Int?;
}

struct Container {
    innerOpt1: InnerOpt?;
    innerOpt2: InnerOpt?;
}

contract OptionalNestedStructs {
    data: Container;

    init() {
        self.data = Container{
            innerOpt1: null,
            innerOpt2: InnerOpt{ value: 42 }
        };
    }
}