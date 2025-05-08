struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract StructManyOptionals {
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