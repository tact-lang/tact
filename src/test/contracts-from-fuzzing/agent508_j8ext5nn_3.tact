struct Params {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int = 7;
}

contract TestContract {
    data: Params;
    init() {
        self.data = Params{
            a: null,
            b: true,
            c: "Test",
            d: null,
            e: null,
            f: null,
            g: 17
        };
    }
}
