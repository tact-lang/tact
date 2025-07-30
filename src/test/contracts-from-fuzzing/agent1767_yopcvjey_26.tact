struct S {
    a: Int;
}

contract OptionalStructField {
    val: S?;

    init() {
        self.val = S{a:42};
    }
}