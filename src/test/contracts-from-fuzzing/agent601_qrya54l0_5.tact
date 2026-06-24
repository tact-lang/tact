struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract Test {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
