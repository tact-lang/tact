struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract OptionalFieldsTest {
    storage: DeepOptionals;

    init() {
        self.storage = DeepOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}