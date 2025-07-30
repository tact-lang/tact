struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    valOpt: Int?;
}

contract TestContract {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            innerOpt: Inner{
                valOpt: null
            }
        };
    }
}
