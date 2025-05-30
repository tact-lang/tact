struct OptionInStruct {
    title: String;
    note: String?;
    flag: Bool;
}

contract OptionalInsideStruct {
    optStruct: OptionInStruct;

    init() {
        self.optStruct = OptionInStruct{
            title: "abc",
            note: null,
            flag: true,
        };
    }
}