struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract PartialOptionals {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            a: 42,
            d: emptyCell(),
            // b, c, e remain unset => should default to null
        };
    }
}