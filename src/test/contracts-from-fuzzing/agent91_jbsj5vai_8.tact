struct Optionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OnlyOptionalFields {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: true,
            c: 42,
            d: null
        };
    }
}
