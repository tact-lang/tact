struct OptionStruct {
    id: Int?;
    flag: Bool?;
    note: String?;
}

contract TestContract {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            id: null,
            flag: true,
            note: null
        };
    }
}