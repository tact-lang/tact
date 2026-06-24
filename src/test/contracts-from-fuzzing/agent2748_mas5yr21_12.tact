struct MultiOption {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptStructFields {
    data: MultiOption;

    init() {
        self.data = MultiOption{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}