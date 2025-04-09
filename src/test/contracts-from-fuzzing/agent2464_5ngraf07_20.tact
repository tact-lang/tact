struct OptionalMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionals {
    s: OptionalMany;

    init() {
        self.s = OptionalMany{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
