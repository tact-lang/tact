struct SOpt {
    a: Int?;
    b: Bool?;
}

contract PartialOptionals {
    s: SOpt;

    init() {
        self.s = SOpt{ a: 5, b: null };
    }
}