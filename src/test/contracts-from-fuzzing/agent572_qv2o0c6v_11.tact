struct OptionalNested {
    innerOpt: Int?;
    flag: Bool;
}

contract StructWithNestedOptional {
    s: OptionalNested;
    init() {
        self.s = OptionalNested{ innerOpt: null, flag: true };
    }
}