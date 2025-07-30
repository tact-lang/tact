struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptionalFieldsTest {
    payload: DeeplyOptional;

    init() {
        self.payload = DeeplyOptional{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}