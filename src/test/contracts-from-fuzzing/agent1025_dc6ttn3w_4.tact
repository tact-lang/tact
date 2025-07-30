struct HasOptionals {
    boolField: Bool?;
    intField: Int?;
    strField: String?;
}

contract OptionalTest {
    foo: HasOptionals;

    init() {
        self.foo = HasOptionals{
            boolField: null,
            intField: null,
            strField: null,
        };
    }
}