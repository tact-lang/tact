struct SOpt {
    x: Int?;
}

contract InitNestedNull {
    s: SOpt;

    init() {
        self.s = SOpt{ x: null };
    }
}