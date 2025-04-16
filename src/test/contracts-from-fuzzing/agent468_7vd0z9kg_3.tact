struct OptionInner {
    note: String;
}

struct OptionStruct {
    optInner: OptionInner?;
    flag: Bool?;
}

contract OptFieldsTest {
    optStruct: OptionStruct;

    init() {
        self.optStruct = OptionStruct{
            optInner: null,
            flag: null
        };
    }
}