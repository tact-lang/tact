struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Cell?;
}

contract OptFields {
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
