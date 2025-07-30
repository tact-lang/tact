struct OptBool {
    flag: Bool?;
}

contract OptBoolTest {
    data: OptBool;

    init() {
        self.data = OptBool{
            flag: null
        };
    }
}