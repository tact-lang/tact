struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptionTest {
    data: MultiOption;

    init() {
        self.data = MultiOption{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}
