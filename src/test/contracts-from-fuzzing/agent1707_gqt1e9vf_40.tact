struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptNullContract {
    thing: SOpt;

    init() {
        self.thing = SOpt{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}