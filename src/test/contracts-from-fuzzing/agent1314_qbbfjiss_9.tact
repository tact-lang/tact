struct SOpt {
    inner: Int?;
    flag: Bool;
}

contract OptionalInNested {
    s: SOpt;

    init() {
        self.s = SOpt{ inner: null, flag: false };
    }
}