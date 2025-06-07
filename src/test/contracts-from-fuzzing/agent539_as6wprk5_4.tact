struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract OptionalTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}