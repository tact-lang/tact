struct NestedOpt {
    inner: Int?;
}

contract OptionalNested {
    val: NestedOpt?;

    init() {
        self.val = null;
    }
}