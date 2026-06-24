struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract LotsOfOptionals {
    optionalGroup: ManyOptionals;

    init() {
        self.optionalGroup = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}