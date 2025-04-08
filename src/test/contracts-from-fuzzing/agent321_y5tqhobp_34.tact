struct DefaultOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract DefaultOptionalsTest {
    data: DefaultOptionals;
    init() {
        self.data = DefaultOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}