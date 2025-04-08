struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ComplexOptionals {
    f: SOpt;

    init() {
        self.f = SOpt{
            a: null,
            b: null,
            c: null
        };
    }
}