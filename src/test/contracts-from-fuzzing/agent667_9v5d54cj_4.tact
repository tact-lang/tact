struct DeepOptional {
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract HasDeepOptional {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{ nestedOpt: null };
    }
}
