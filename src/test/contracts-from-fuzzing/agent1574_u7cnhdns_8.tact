struct SiblingOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract NullableSiblings {
    sibs: SiblingOpt;

    init() {
        self.sibs = SiblingOpt{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}