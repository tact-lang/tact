struct StringStruct {
    foo: String;
}

contract StringFieldTest {
    val: StringStruct;

    init() {
        self.val = StringStruct{
            foo: "hello world"
        };
    }
}