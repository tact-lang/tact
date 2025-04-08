struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalTest {
    state: ManyOptionals;
    init() {
        self.state = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}