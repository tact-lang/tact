struct SOpt {
    f1: Int?;
}

contract OptionalNested {
    f: SOpt?;

    init() {
        self.f = null;
    }
}