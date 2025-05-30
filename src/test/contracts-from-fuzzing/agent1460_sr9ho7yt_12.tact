struct OptionalOuter {
    a: Int;
}

contract OptionalOuterField {
    out: OptionalOuter?;

    init() {
        self.out = null;
    }
}
