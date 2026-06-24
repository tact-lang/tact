struct OptionalBoolStruct {
    flag: Bool?;
    number: Int;
}

contract OptionalBoolTest {
    data: OptionalBoolStruct;

    init() {
        self.data = OptionalBoolStruct{
            flag: null,
            number: 42
        };
    }
}