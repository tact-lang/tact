struct Deep {
    amount: Int?;
    valid: Bool?;
}

contract ComplexOpt {
    saved: Deep?;

    init() {
        self.saved = Deep{amount: null, valid: true};
    }
}