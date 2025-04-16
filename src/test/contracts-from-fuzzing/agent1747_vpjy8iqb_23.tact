struct SOpt {
    maybeInt: Int?;
}

contract OptionalStructDefault {
    s: SOpt = SOpt{ maybeInt: null };

    init() {
        self.s = SOpt{ maybeInt: 77 };
    }
}