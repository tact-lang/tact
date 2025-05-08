struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract OptTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: 123,
            g: true,
            h: "hello",
            i: emptyCell(),
            j: myAddress()
        };
    }
}