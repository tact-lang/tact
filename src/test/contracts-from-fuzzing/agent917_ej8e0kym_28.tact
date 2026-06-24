struct Wrapped { inner: Int; }
contract OptionalWrapped {
    val: Wrapped?;

    init() {
        self.val = null;
    }
}