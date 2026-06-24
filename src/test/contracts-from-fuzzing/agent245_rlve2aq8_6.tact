struct OptBoolStruct {
    flag: Bool?;
    num: Int;
}

contract OptionalBoolTest {
    data: OptBoolStruct;

    init() {
        self.data = OptBoolStruct{ flag: null, num: 123 };
    }
}