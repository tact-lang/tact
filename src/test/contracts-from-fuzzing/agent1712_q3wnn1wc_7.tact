struct OptionStruct {
    x: Int?;
    y: String?;
    flag: Bool;
}

contract OptionalContract {
    data: OptionStruct;
    
    init() {
        self.data = OptionStruct{
            x: null,
            y: null,
            flag: true
        };
    }
}