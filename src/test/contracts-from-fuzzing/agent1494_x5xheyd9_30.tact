struct SameLevelOptionals {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
}

contract OptionalLayer {
    f: SameLevelOptionals;

    init() {
        self.f = SameLevelOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
