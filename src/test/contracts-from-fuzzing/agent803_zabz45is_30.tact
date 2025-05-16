struct OptionalBoolDefault {
    optFlag: Bool?;
    v: Int;
}

contract OptionalBoolTest {
    data: OptionalBoolDefault;
    init() {
        self.data = OptionalBoolDefault{
            optFlag: null,
            v: 99
        };
    }
}