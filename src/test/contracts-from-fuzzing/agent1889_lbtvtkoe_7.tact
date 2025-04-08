struct OptionalNested {
    innerOpt: Int?;
    deepOpt: String?;
}

struct ParentOpt {
    nestedOpt: OptionalNested?;
}

contract NestedOptionals {
    store: ParentOpt;

    init() {
        self.store = ParentOpt{
            nestedOpt: null
        };
    }
}
