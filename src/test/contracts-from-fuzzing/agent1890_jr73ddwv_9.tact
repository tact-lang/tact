struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStorage {
    strings: StringStruct;

    init() {
        self.strings = StringStruct{
            s1: "abc",
            s2: "the quick brown",
            s3: "fox jumps"
        };
    }
}