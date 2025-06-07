struct OptionalNested {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            a: 1,
            b: null,
            c: null,
            d: null
        };
    }
}
