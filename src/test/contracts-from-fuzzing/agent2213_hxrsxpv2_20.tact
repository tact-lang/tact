struct StrStruct {
    s1: String;
    s2: String;
}

contract StringsContract {
    str: StrStruct;

    init() {
        self.str = StrStruct{
            s1: "hello",
            s2: "world",
        };
    }
}
