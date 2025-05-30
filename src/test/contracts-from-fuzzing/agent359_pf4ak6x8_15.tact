struct StringStruct {
    s1: String;
    os: String?;
}

contract StringsTest {
    val: StringStruct;
    init() {
        self.val = StringStruct{
            s1: "hello",
            os: null
        };
    }
}