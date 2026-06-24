struct StringStruct {
    str1: String;
    str2: String;
}

contract TestContract {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            str1: "abc",
            str2: "def",
        };
    }
}