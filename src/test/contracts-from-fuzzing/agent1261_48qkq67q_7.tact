struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalOnly {
    data: SOpt;

    init() {
        self.data = SOpt{ a: null, b: null, c: null };
    }
}