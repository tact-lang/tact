struct StrStruct {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringsTest {
    s: StrStruct;

    init() {
        self.s = StrStruct{
            s1: "hello",
            s2: null,
            s3: "world",
            s4: null,
        };
    }
}