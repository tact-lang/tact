struct StrStruct {
    s1: String;
    s2: String;
}

contract StringFields {
    field: StrStruct;

    init() {
        self.field = StrStruct{
            s1: "abc",
            s2: "def"
        };
    }
}
