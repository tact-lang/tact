struct InnerOption {
    x: Int?;
}

struct MiddleOption {
    y: InnerOption?;
}

contract OptionInStructWithOption {
    field: MiddleOption;

    init() {
        self.field = MiddleOption{ y: InnerOption{ x: 7 } };
    }
}