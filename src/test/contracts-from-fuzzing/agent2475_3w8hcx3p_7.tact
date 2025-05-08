struct NestedInOptional {
    x: Int;
}

contract OptionalStructField {
    val: NestedInOptional?;
    init() {
        self.val = null;
    }
}