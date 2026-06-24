struct Wrapped {
    val: Int;
}

contract OptionalWrapped {
    w: Wrapped?;

    init() {
        self.w = null;
    }
}