struct OptionalFieldStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract OptionalFieldsTest {
    x: OptionalFieldStruct;

    init() {
        self.x = OptionalFieldStruct{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}