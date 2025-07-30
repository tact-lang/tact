struct StrStruct {
    s1: String;
    s2: String?;
}

contract StringStructTest {
    content: StrStruct;

    init() {
        self.content = StrStruct{
            s1: "Hello",
            s2: null,
        };
    }
}