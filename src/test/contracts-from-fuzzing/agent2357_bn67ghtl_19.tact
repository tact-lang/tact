struct HasString {
    a: String;
    b: String?;
}

contract StringInStruct {
    s: HasString;

    init() {
        self.s = HasString{ a: "hello", b: null };
    }
}
