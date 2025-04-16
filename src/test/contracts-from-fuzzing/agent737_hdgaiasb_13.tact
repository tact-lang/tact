struct HasString {
    str1: String;
    str2: String;
    str3: String;
}

contract TestContract {
    data: HasString;

    init() {
        self.data = HasString{
            str1: "abc",
            str2: "def",
            str3: "ghi"
        };
    }
}
