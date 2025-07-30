struct StringsTestStruct {
    s1: String;
    s2: String?;
    s3: String = "";
    s4: String? = null;
}

contract StringsTest {
    data: StringsTestStruct;
    init() {
        self.data = StringsTestStruct{
            s1: "hello",
            s2: null,
            s3: "",
            s4: null
        };
    }
}