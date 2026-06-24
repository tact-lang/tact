struct OptionalNest {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract TestContract {
    stored: OptionalNest;

    init() {
        self.stored = OptionalNest{innerOpt: null};
    }
}
