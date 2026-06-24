struct OptionalsOrder {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int;
}

contract MultipleOptionalsOrder {
    data: OptionalsOrder;

    init() {
        self.data = OptionalsOrder{
            a: null, b: null, c: null, d: null, e: 123
        };
    }
}