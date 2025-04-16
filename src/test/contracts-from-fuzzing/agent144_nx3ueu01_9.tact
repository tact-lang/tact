struct OptionalNest {
    inn: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestField {
    nestedOpt: OptionalNest;

    init() {
        self.nestedOpt = OptionalNest{
            inn: Inner{val: 42}
        };
    }
}
