struct StringStruct {
    foo: String;
}

contract StringStorage {
    s: StringStruct;

    init() {
        self.s = StringStruct { foo: "hello" };
    }
}