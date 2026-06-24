struct Tiny {
    f: Bool;
}

contract OptionalOnly {
    nested: Tiny?;

    init() {
        self.nested = null;
    }
}