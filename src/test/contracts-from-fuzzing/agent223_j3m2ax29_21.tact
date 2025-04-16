struct S {
    x: Int;
    y: Bool;
}

contract OptionalStructInitialized {
    s: S?;

    init() {
        self.s = S{x: 5, y: true};
    }
}