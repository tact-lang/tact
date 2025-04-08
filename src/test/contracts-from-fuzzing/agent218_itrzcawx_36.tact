struct NestedBoolOpt {
    innerOpt: Bool?;
    another: Int;
}

contract BoolOptContract {
    s: NestedBoolOpt;

    init() {
        self.s = NestedBoolOpt{
            innerOpt: true,
            another: 5
        };
    }
}