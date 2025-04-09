struct SOpt {
    f: Int?;
}

contract NullableDefaultOpt {
    s: SOpt;
    init() {
        self.s = SOpt{ f: null };
    }
}