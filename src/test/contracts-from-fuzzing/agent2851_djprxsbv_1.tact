struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract UseDeepOptional {
    state: DeepOptionals;

    init() {
        self.state = DeepOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
