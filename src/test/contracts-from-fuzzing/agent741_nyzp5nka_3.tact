struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    manyOpt: ManyOptionals;

    init() {
        self.manyOpt = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}