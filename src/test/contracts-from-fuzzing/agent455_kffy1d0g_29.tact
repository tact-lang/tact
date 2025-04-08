struct Wrapped {
    num: Int;
}

contract OptionalWrapped {
    x: Wrapped?;

    init() {
        self.x = null;
    }
}