struct EmptyNested {
    s: String;
}

contract OptEmptyNested {
    f: EmptyNested?;

    init() {
        self.f = null;
    }
}