struct Wrapped {
    inner: Int;
}

contract OptionalWrapped {
    val: Wrapped?;

    init() {
        self.val = null;
        self.val = Wrapped { inner: 123 };
    }
}