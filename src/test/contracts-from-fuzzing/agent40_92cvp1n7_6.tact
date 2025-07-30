struct OptionalStruct {
    number: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            number: null,
            flag: null,
            text: null
        };
    }
}