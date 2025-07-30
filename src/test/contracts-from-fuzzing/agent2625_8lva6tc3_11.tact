struct StringStruct {
    s1: String;
    s2: String?;
}

contract StringsTest {
    d: StringStruct;

    init() {
        self.d = StringStruct{
            s1: "hello",
            s2: null
        };
    }
}
