struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalFieldsContract {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}