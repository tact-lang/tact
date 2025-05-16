struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptDeepStructTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}