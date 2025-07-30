struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract Test10 {
    opty: ManyOptional;

    init() {
        self.opty = ManyOptional{
            a: 1,
            b: null,
            c: "hello",
            d: null,
            e: emptyCell(),
            f: null,
        };
    }
}