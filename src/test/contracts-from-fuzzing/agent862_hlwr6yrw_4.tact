struct OptionalInsideNested {
    innerOpt1: Int?;
    innerOpt2: Bool?;
    innerOpt3: Cell?;
}

struct NestedOptionals {
    nested: OptionalInsideNested?;
}

contract TestOptionalStructs {
    sfield: NestedOptionals;

    init() {
        self.sfield = NestedOptionals{
            nested: null
        };
    }
}
