struct SOpt {
    a: Int?;
}

contract OptionalFieldNullInitial {
    s: SOpt;

    init() {
        self.s = SOpt{ a: null };
    }
}