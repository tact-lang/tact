struct SOpt {
    x: Int;
    y: String?;
}

contract NestedOptMix {
    s1: SOpt?;
    s2: SOpt;

    init() {
        self.s1 = null;
        self.s2 = SOpt{ x: 3, y: null };
    }
}