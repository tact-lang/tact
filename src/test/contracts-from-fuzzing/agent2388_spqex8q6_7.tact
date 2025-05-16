struct StringsStruct {
    text1: String;
    text2: String;
    text3: String?;
}

contract StringHeavy {
    str: StringsStruct;

    init() {
        self.str = StringsStruct{
            text1: "alpha",
            text2: "beta",
            text3: null
        };
    }
}