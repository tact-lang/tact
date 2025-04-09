struct DiverseOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
}

contract OptionalStructDiverse {
    val: DiverseOptionals;

    init() {
        self.val = DiverseOptionals{
            i: null,
            b: null,
            s: null,
            c: null,
            sl: null,
            a: null
        };
    }
}
