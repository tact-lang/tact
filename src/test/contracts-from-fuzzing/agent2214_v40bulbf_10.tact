struct Nested {
    a: Int;
    b: Bool;
}

contract OptionalTopLevel {
    val: Nested?;

    init() {
        self.val = null;
    }
}