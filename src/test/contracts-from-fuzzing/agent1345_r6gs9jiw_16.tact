struct StrStruct {
    name: String;
    message: String;
}

contract StringFieldsTest {
    data: StrStruct;

    init() {
        self.data = StrStruct{ name: "abc", message: "hello" };
    }
}