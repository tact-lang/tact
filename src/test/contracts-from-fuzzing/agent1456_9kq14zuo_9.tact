struct ManyOptionalPrimitives {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
    a1: Address?;
    a2: Address?;
    c1: Cell?;
    sl1: Slice?;
    bu1: Builder?;
}

contract ManyOptionalsContract {
    storage: ManyOptionalPrimitives;

    init() {
        self.storage = ManyOptionalPrimitives{
            i1: null,
            i2: null,
            i3: null,
            b1: null,
            b2: null,
            s1: null,
            s2: null,
            a1: null,
            a2: null,
            c1: null,
            sl1: null,
            bu1: null
        };
    }
}
