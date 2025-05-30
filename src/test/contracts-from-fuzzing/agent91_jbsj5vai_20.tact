struct StringStruct {
    text: String;
    num: Int;
}

contract StringStorageTest {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            text: "Hello, World!",
            num: 17
        };
    }
}
