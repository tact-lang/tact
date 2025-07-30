struct MultipleOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract OptionalFieldsTest {
    s: MultipleOptionals;

    init() {
        self.s = MultipleOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
