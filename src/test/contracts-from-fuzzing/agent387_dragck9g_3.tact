struct OptionalNested {
    innerOpt: Int?;
    val: Bool;
}

contract TestNestedOpt {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{innerOpt: null, val: true};
    }
}
