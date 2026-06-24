struct MultipleOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract ManyOptionalsTest {
    foo: MultipleOptionalFields;

    init() {
        self.foo = MultipleOptionalFields{
            a: 1, b: null, c: 3
        };
    }
}