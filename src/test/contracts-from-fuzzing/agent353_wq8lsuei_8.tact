struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract TestContract {
    stuff: HasManyOptionals;

    init() {
        self.stuff = HasManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}