struct S {
    x: Int = 1;
}

contract OptionalStructField {
    val: S?;

    init() {
        self.val = null;
    }
}