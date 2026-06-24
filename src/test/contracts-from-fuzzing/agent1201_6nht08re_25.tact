struct DefaultBoolOpt {
    flag: Bool? = null;
}

contract BoolOptDefaultTest {
    data: DefaultBoolOpt;

    init() {
        self.data = DefaultBoolOpt{};
    }
}