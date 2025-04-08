struct ManyOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Int?;
}

contract Test {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: null
        };
    }
}
