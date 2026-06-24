struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Address?;
    g: Cell?;
    h: Slice?;
    i: String?;
}

contract ManyOptionalsTest {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null,
            b: null,
            c: 0,
            d: true,
            e: null,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: "hello",
        };
    }
}