struct DeepOptionalNest {
    maybeInner: Middle?;
}

struct Middle {
    maybeDeep: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract TestContract {
    f: DeepOptionalNest;

    init() {
        self.f = DeepOptionalNest{
            maybeInner: Middle{
                maybeDeep: InnerMost{ val: 123 }
            }
        };
    }
}