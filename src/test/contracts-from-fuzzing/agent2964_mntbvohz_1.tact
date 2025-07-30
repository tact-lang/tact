struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
    e: Address?;
}

contract MultiOptionalContract {
    optdata: ManyOptionals;

    init() {
        self.optdata = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}