struct NestedOptional {
    nestedOpt: Int?;
    another: Bool;
}

contract NestedOptionalContract {
    data: NestedOptional?;

    init() {
        self.data = NestedOptional{
            nestedOpt: 42,
            another: true
        };
    }
}
