struct S {
    foo: Int;
}

contract OptionalStructWithNull {
    val: S?;

    init() {
        self.val = null;
    }
}
