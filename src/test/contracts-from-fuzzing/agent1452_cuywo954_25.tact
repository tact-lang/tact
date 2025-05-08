struct SOpt {
    x: Int?;
    y: Bool?;
}

contract OptVars {
    s1: SOpt? = null;
    s2: SOpt?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}