struct SOpt {
    i: Int?;
}

contract OptOnField {
    v: SOpt;

    init() {
        self.v = SOpt { i: null };
    }
}