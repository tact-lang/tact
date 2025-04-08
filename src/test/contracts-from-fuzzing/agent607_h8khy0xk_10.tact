struct NestedOptional {
    innerOpt: Int?;
}

contract TestNestedOpt {
    s: NestedOptional?;

    init() {
        self.s = NestedOptional{ innerOpt: 123 };
    }
}