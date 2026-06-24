struct StringStruct {
    s1: String;
    s2: String?;
}

contract StringStructTest {
    strct: StringStruct;

    init() {
        self.strct = StringStruct{
            s1: "ok",
            s2: null
        };
    }
}