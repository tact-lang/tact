struct OptNest {
    inner: Int?;
    nestedOpt: NestedOpt?;
}

struct NestedOpt {
    value: Bool?;
}

contract OptionNested {
    field: OptNest;

    init() {
        self.field = OptNest{
            inner: null,
            nestedOpt: null,
        };
    }
}
