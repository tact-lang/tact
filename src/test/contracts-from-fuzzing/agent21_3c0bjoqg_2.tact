struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Address?;
}

contract TestContract {
    manyOpt: ManyOptions;

    init() {
        self.manyOpt = ManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}