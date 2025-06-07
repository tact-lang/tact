struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptTest {
    optFields: ManyOptionals;
    init() {
        self.optFields = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hello",
        };
    }
}