struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalTypes {
    state: WithOptionals;

    init() {
        self.state = WithOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: null,
        };
    }
}