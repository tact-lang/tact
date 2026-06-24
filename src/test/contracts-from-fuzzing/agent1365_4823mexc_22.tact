struct NestedOptional {
    innerOpt: Int?;
}

contract OptionalInsideOptional {
    opt: NestedOptional?;

    init() {
        self.opt = NestedOptional{
            innerOpt: null,
        };
    }
}