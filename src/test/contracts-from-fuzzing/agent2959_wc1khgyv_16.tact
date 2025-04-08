struct EmptyStr {
    text: String;
}

contract IncludeEmptyString {
    val: EmptyStr;

    init() {
        self.val = EmptyStr{text:""};
    }
}