struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Cell?;
}

contract OptsInState {
    optState: ManyOptionals;
    init() {
        self.optState = ManyOptionals{
            a: null,
            b: 5,
            c: null,
            d: true,
            e: null,
            f: "test",
            g: emptyCell()
        };
    }
}