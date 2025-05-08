struct SOpt {
    i: Int?;
}

contract StructOptField {
    s: SOpt;

    init() {
        self.s = SOpt{i: null};
    }
}