struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract TestContract {
    data: ManyOpts = ManyOpts{ a: null, b: null, c: null, d: null };

    init() {
        self.data = ManyOpts{
            a: 1,
            b: true,
            c: null,
            d: null
        };
    }

    receive() {
        // dummy
    }
}