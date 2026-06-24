struct OptionalStringBool {
    text: String?;
    flag: Bool?;
}

contract OptStringBoolTest {
    data: OptionalStringBool;

    init() {
        self.data = OptionalStringBool{
            text: null,
            flag: true,
        };
    }

    receive() {}
}
