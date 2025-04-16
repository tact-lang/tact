struct StringStruct {
    name: String;
    desc: String?;
}

contract StringStorage {
    meta: StringStruct;

    init() {
        self.meta = StringStruct{
            name: "Test",
            desc: null,
        };
    }
}