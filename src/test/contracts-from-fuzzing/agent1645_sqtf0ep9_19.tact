struct Flat {
    x: Int;
    y: Int;
}

contract OptionalStructFieldPersistence {
    s: Flat?;

    init() {
        self.s = null;
    }
}