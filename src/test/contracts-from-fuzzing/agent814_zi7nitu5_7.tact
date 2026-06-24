struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}