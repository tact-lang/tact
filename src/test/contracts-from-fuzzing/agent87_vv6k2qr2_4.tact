struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Bool?;
}

contract NestedOptional {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            innerOpt: null
        };
    }
}
