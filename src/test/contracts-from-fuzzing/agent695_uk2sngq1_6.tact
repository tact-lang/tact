struct OnlyOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
}

contract OptsOnly {
    stuff: OnlyOptionals;

    init() {
        self.stuff = OnlyOptionals{
            a: null,
            b: null,
            c: null,
            d: true,
        };
    }
}