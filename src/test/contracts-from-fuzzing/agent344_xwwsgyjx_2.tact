struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract MultipleNulls {
    defaults: ManyOptionals;

    init() {
        self.defaults = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}