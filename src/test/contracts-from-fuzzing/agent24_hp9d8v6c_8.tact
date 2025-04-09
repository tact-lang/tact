struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalFieldsTest {
    f: HasOptionals;

    init() {
        self.f = HasOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}