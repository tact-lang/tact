struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Int?;
    h: Bool?;
}

contract Test {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 7,
            h: null,
        };
    }
}
