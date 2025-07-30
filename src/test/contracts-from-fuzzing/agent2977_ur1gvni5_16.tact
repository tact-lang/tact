struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalInsideField {
    val: NestedOpt?;
    init() {
        self.val = null;
    }
}