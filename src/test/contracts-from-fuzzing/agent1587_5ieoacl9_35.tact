struct SOpt {
    x: Int?;
}

contract NegAssign {
    s: SOpt;

    init() {
        self.s = SOpt{};
    }
}