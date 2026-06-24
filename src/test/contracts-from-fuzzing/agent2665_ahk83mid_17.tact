struct OptionalSet {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptDefault {
    data: OptionalSet;

    init() {
        self.data = OptionalSet{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}