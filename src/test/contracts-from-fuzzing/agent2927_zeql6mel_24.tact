struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
}

contract BigOptionalStruct {
    bigOpt: HasManyOptionals;

    init() {
        self.bigOpt = HasManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}