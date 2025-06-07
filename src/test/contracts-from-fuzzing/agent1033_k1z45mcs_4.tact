struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalStorage {
    state: WithOptionals;

    init() {
        self.state = WithOptionals{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null
        };
    }
}