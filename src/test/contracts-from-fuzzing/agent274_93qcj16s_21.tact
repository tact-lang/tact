struct OptionalBool {
    f: Bool?;
}

contract OptBoolTest {
    flag: OptionalBool;

    init() {
        self.flag = OptionalBool{
            f: null,
        };
    }
}