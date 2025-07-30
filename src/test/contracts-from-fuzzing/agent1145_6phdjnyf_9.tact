struct NullableFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract NullableTest {
    data: NullableFields;

    init() {
        self.data = NullableFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
