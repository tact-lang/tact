struct DiverseOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    data: DiverseOpts;

    init() {
        self.data = DiverseOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}