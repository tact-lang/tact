struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalStructTest {
    m: MultiOptionals;

    init() {
        self.m = MultiOptionals {
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}