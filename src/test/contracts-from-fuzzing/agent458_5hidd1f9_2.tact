struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptionalStorage {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
