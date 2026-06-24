struct SOpt {
    maybe: Int?;
}

contract InitDirectOptional {
    s: SOpt;
    init() {
        self.s = SOpt{ maybe: null };
    }
}