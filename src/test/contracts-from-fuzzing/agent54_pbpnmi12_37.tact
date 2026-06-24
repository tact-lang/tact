struct OptNestedOpt {
    inner: Int?;
}

contract NestedOptionalNullField {
    val: OptNestedOpt?;

    init() {
        self.val = null;
    }
}