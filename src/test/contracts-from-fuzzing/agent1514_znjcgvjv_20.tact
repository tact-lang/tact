struct Compose {
    a: Int;
    b: Bool;
}

contract OptionalStructWithDefaultNull {
    s: Compose?;

    init() {
        self.s = null;
    }
}