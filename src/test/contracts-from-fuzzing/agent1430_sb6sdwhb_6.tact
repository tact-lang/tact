struct WithLotsOfOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    data: WithLotsOfOptionals;

    init() {
        self.data = WithLotsOfOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "abc",
        };
    }
}
