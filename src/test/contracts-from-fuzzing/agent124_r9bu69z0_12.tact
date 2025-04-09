struct SOpt {
    a: Int;
    b: String?;
    c: Int?;
}

contract OptFields {
    state: SOpt;
    init() {
        self.state = SOpt{ a: 5, b: null, c: null };
    }
}