struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    val: Opts;
    init() {
        self.val = Opts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}