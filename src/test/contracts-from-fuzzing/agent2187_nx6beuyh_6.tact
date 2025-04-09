struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: String?;
}

contract ManyOptionals {
    mo: MultiOpt;

    init() {
        self.mo = MultiOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}