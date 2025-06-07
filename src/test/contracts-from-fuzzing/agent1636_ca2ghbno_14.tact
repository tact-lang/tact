struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    opts: MultiOptionals;

    init() {
        self.opts = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: myAddress(),
            e: 42,
            f: true
        };
    }
}