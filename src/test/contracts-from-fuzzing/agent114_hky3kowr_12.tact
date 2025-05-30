struct OptionInMiddle {
    first: Int;
    maybe: String?;
    second: Bool;
}

contract OptionalMiddleContract {
    data: OptionInMiddle;

    init() {
        self.data = OptionInMiddle{
            first: 42,
            maybe: null,
            second: true,
        };
    }
}