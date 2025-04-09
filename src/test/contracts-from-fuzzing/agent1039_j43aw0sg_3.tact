struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}