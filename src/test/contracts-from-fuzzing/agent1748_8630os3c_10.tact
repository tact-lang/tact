struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalCollection {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}