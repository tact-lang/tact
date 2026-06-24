struct SeveralOptionals {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract MultipleOptionalsPersist {
    f: SeveralOptionals;

    init() {
        self.f = SeveralOptionals{
            b1: null,
            b2: true,
            b3: false
        };
    }
}