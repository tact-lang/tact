struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
}

contract LotsOfOptionals {
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