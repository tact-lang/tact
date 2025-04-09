struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MultiTypeOpts {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}