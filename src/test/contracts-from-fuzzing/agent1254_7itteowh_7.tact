struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalFields {
    field: ManyOptionals;
    init() {
        self.field = ManyOptionals{
            a: 1,
            b: null,
            c: null,
            d: null,
        };
    }
}