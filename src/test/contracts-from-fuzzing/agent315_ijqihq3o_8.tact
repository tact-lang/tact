struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract ManyOptionalStructs {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}