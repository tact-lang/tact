struct S {
    v: Int;
}

contract OptionalStructField {
    val: S?;
    init() {
        self.val = null;
    }
}