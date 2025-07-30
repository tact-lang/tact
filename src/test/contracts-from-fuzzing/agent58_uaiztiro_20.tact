struct S1 {
    x: Int;
}

contract OptionalStructPersistent2 {
    s: S1?;

    init() {
        self.s = S1{ x: 42 };
    }
}