struct OptionalNested {
    innerOpt: NestedOpt?;
}

struct NestedOpt {
    val: Int;
}

contract OptNestContract {
    d: OptionalNested;

    init() {
        self.d = OptionalNested{
            innerOpt: NestedOpt{
                val: 7,
            },
        };
    }
}