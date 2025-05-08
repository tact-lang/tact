struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptTest {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}
