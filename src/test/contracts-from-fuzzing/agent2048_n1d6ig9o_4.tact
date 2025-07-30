struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Builder?;
}

contract TestManyOptionals {
    state: ManyOptionals;
    init() {
        self.state = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: beginCell(),
        };
    }
}
