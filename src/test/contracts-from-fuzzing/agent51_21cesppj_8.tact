struct ContainsString {
    s: String;
}

contract StringFields {
    str1: String;
    str2: String;
    nested: ContainsString;

    init() {
        self.str1 = "abc";
        self.str2 = "def";
        self.nested = ContainsString{ s: "ghi" };
    }
}