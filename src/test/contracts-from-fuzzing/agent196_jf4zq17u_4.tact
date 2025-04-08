struct NestedOptional {
    foo: Int?;
    bar: Bool;
}

contract NestedOptionalField {
    val: NestedOptional?;

    init() {
        self.val = null;
    }
}