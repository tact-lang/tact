struct InnerMost {
    innermost: Int;
}

struct Inner {
    innerOpt: InnerMost?;
}

contract DeepOptionalStructField {
    data: Inner?;
    init() {
        self.data = Inner{
            innerOpt: InnerMost{
                innermost: 999,
            }
        };
    }
}
