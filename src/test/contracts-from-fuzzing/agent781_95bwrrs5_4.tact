struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: Address?;
    f: String?;
}

contract TestContract {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}