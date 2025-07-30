struct OptionalWrap {
    innerOpt: Int?;
}

contract OptionalStructTest {
    wrap: OptionalWrap;

    init() {
        self.wrap = OptionalWrap{
            innerOpt: 42
        };
    }
}