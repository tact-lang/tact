struct SOpt {
    val: Int?;
}

contract OptionalStructAsOptional {
    f: SOpt?;

    init() {
        self.f = SOpt{ val: null };
    }
}
