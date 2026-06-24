struct InnerMost {
    flag: Bool?;
    value: Int;
}

contract OptionalDefaultTest {
    state: InnerMost = InnerMost{
        value: 99,
    };

    init() {
        self.state = InnerMost{
            flag: true,
            value: 42,
        };
    }
}