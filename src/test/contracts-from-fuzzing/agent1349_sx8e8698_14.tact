struct SWithOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    s: String?;
}

contract StructWithOptionals {
    f: SWithOptionals;

    init() {
        self.f = SWithOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            s: null
        };
    }
}