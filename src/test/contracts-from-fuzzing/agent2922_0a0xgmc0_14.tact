struct OptionalInsideOpt {
    nestedOpt: SimpleOpt?;
}

struct SimpleOpt {
    x: Int?;
}

contract OptionalNesting {
    val: OptionalInsideOpt;

    init() {
        self.val = OptionalInsideOpt {
            nestedOpt: null
        };
    }
}