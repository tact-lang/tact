struct MixOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Address?;
}

contract MixedOptionals {
    comp: MixOpt;

    init() {
        self.comp = MixOpt{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
            e: null
        };
    }
}