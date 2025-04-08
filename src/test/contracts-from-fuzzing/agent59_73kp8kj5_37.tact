struct SOpt {
    foo: Int?;
    bar: String?;
}

contract WithNullDefaultOpt {
    s1: SOpt? = null;
    s2: SOpt?;
    init() {
        self.s2 = null;
    }
}
