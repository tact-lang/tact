struct SOpt {
    s: String?;
}

contract OptionalStringStruct {
    s: SOpt;

    init() {
        self.s = SOpt{ s: null };
    }
}