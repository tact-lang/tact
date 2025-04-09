struct MultiOption {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract TestContract {
    f: MultiOption;

    init() {
        self.f = MultiOption{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}