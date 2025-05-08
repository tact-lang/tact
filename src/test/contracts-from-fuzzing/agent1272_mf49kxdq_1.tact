struct OptionalsTop {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptFieldsTest {
    field: OptionalsTop;
    
    init() {
        self.field = OptionalsTop{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}