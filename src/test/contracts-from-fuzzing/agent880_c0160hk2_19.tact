struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract LotsOfOptionals {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null,
            b: 2,
            c: null,
            d: 4,
            e: null,
        };
    }
}