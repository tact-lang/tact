struct HasString {
    name: String;
}

contract StringStruct {
    s: HasString;
    init() {
        self.s = HasString{ name: "x" };
    }
}