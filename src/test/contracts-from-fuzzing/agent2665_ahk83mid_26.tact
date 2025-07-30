struct S {
    a: Int;
}

contract OptionalStructNull {
    x: S? = null;

    init() {
        self.x = null;
    }
}