struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    value: Int?;
}

contract OptionalContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            innerOpt: Inner{value: null},
        };
    }
}