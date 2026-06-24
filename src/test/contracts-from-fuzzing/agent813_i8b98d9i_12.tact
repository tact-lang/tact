struct Basic {
    x: Int;
    y: Bool;
}

contract OptionalFieldNested {
    s: Basic?;

    init() {
        self.s = null;
    }
}