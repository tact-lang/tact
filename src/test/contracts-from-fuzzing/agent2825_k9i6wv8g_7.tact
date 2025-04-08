struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptPrimTest {
    v: WithOptionals;

    init() {
        self.v = WithOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}
