struct DeepOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: Address?;
}

contract OptionalStructTest {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}