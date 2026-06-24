struct WeirdOrder {
    opt1: Int?;
    req: Int;
}

contract OptReqOrder {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder { opt1: null, req: 123 };
    }
}
