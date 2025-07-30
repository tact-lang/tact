struct OptionStruct {
    info: String?;
    flag: Bool?;
}

contract OptionStructField {
    myData: OptionStruct;

    init() {
        self.myData = OptionStruct{
            info: null,
            flag: true
        };
    }
}