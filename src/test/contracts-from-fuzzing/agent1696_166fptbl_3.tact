struct OptionalMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalTest {
    data: OptionalMany;

    init() {
        self.data = OptionalMany{
            a: 10,
            b: null,
            c: "test",
            d: null
        };
    }
}