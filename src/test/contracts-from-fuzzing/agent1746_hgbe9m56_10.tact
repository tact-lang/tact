struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract TestContract {
    optField: SOpt;

    init() {
        self.optField = SOpt{
            a: null,
            b: true,
            c: null,
            d: 10,
        };
    }
}
