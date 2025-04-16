struct StringStruct {
    text: String = "hello";
}

contract StringStore {
    s: StringStruct = StringStruct{};

    init() {
        self.s = StringStruct{text: "changed"};
    }

    receive() {
        let _ = self.s.text;
    }
}