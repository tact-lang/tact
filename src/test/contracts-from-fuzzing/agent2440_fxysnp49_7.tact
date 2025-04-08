struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptStorage {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}
