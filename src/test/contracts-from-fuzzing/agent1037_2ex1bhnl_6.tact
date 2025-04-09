struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: null,
            g: 42,
            h: false
        };
    }
}