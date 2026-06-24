struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    state: OptionalNest;

    init() {
        self.state = OptionalNest{
            innerOpt: null
        };
    }
}