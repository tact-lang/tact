struct OptionStruct {
    data: String?;
    flag: Bool?;
    count: Int?;
}

contract OptionalTest {
    info: OptionStruct;

    init() {
        self.info = OptionStruct{
            data: null,
            flag: null,
            count: null
        };
    }
}