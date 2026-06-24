struct SOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalInStorage {
    s: SOpt;

    init() {
        self.s = SOpt{ a: null, b: null };
    }
}
