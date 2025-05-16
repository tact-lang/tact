struct SOpt {
    a: Int?;
    b: Bool?;
}

contract EmbeddedOptionals {
    f: SOpt;

    init() {
        self.f = SOpt { a: null, b: true };
    }
}